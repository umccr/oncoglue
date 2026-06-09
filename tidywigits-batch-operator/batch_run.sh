#!/bin/bash
set -uo pipefail

# =============================================================================
# CONFIG — all variables in one place
# =============================================================================
TIDYWIGITS_IMAGE_URL="ghcr.io/tidywf/tidywigits"
TIDYWIGITS_IMAGE_TAG="0.0.7.9003"

# Datalake destination
DATALAKE_BUCKET="s3-copy-cache-042906701326-ap-southeast-2-an"
DATALAKE_PREFIX="tidywigits/v1"

# Input: mountpoint-s3 must be mounted at ./data/input before running this script
OUTPUT_BASE="./data/output/tidywigits/${TIDYWIGITS_IMAGE_TAG}"
DATALAKE_SCRIPT="./datalake.py"

# Python interpreter — must have: python-ulid pyarrow python-dotenv
# Use uv for a self-contained ephemeral env (recommended):
PYTHON="uv run --with python-ulid --with pyarrow --with python-dotenv python3"
# Or activate a conda/venv env and use plain python3:
# PYTHON="python3"

RUN_IDS=(
#  pragma: allowlist nextline secret
  "20260116b1df9558" "2026011570ff5f9c" "20260115696ddf68" "20260114e6710ef8" "20260114beb03c89"
)
# =============================================================================

AUDIT_LOG="./batch_audit_$(date -u +%Y%m%dT%H%M%SZ).tsv"
echo -e "timestamp\trun_id\tstatus\tnotes" > "$AUDIT_LOG"

log_audit() {
    local run_id="$1" status="$2" notes="${3:-}"
    local line
    line="$(date -u +%Y-%m-%dT%H:%M:%SZ)\t${run_id}\t${status}\t${notes}"
    echo -e "$line" | tee -a "$AUDIT_LOG"
}

export TIDYWIGITS_IMAGE_URL TIDYWIGITS_IMAGE_TAG

for RUN_ID in "${RUN_IDS[@]}"; do
    echo ""
    echo "=========================================="
    echo "Processing: $RUN_ID"
    echo "=========================================="

    OUTPUT_DIR="${OUTPUT_BASE}/${RUN_ID}"
    mkdir -p "$OUTPUT_DIR/_metadata"

    echo "Running tidywigits"
    # Step 1: tidy
    if ! time docker compose run -q --rm tidywigits tidywigits.R tidy \
        -f parquet \
        -d ./input/"$RUN_ID" \
        -o ./output/tidywigits/"$TIDYWIGITS_IMAGE_TAG"/"$RUN_ID" \
        --ulid --prefix_include --input_id "$RUN_ID"; then
        log_audit "$RUN_ID" "FAILED" "tidy step"
        continue
    fi
    echo "Tidywigits complete. Output at: $OUTPUT_DIR"

    echo "Syncing to datalake and verifying"
    # Step 2: datalake sync + verify
    if ! DATALAKE_BUCKET="$DATALAKE_BUCKET" \
         DATALAKE_PREFIX="$DATALAKE_PREFIX" \
         TIDYWIGITS_OUTPUT_DIR="$OUTPUT_BASE" \
         $PYTHON "$DATALAKE_SCRIPT" --run-id "$RUN_ID" --execute --verify; then
        log_audit "$RUN_ID" "FAILED" "datalake sync/verify"
        continue
    fi

    # Step 3: cleanup local output (only after confirmed sync)
    if ! rm -rf "$OUTPUT_DIR"; then
        log_audit "$RUN_ID" "PARTIAL" "sync ok but local cleanup failed: $OUTPUT_DIR"
        continue
    fi

    log_audit "$RUN_ID" "SUCCESS" ""
done

echo ""
echo "Batch complete. Audit log: $AUDIT_LOG"
