#!/usr/bin/env Rscript

{
  use("arrow", "read_parquet")
  use("ulid", "unmarshal")
  use("fs", c("dir_ls", "path"))
  use("tibble", "as_tibble_col")
  use("dplyr")
  use("glue", "glue")
  use("processx", "run")
}

# load .env into avail env vars
stopifnot(file.exists(".env"))
readRenviron(".env")

DATALAKE_BUCKET <- Sys.getenv("DATALAKE_BUCKET")
DATALAKE_PREFIX <- Sys.getenv("DATALAKE_PREFIX")
TIDYWIGITS_OUTPUT_DIR <- Sys.getenv("TIDYWIGITS_OUTPUT_DIR")
meta_parquet <- "metadata.parquet"
# use meta to grab:
# - input_id for prid
# - output_id for batch_date + batch_id
dir_ls(TIDYWIGITS_OUTPUT_DIR, type = "directory") |>
  as_tibble_col("input_dir") |>
  rowwise() |>
  mutate(
    metafile = path(.data$input_dir, meta_parquet),
    meta = list(read_parquet(.data$metafile)),
    input_id = meta[["input_id"]],
    input_id_match = stopifnot(
      "input_id mismatch" = basename(input_dir) == .data$input_id
    ),
    output_id = meta[["output_id"]],
    batch_date = as.character(as.Date(
      unmarshal(.data$output_id)$ts,
      tz = "UTC"
    )),
    s3_target = glue(
      "s3://{DATALAKE_BUCKET}/{DATALAKE_PREFIX}/",
      "batch_date={.data$batch_date}/",
      "portal_run_id={.data$input_id}/",
      "batch_id={.data$output_id}"
    ),
    cmd_run = list(
      processx::run(
        "aws",
        c("s3", "sync", "--no-progress", .data$input_dir, .data$s3_target),
        echo = TRUE
      )
    )
  ) |>
  ungroup()
