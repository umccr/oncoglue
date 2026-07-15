#!/usr/bin/env Rscript

{
  use("arrow", "read_parquet")
  use("ulid", "unmarshal")
  use("fs", c("dir_ls", "path"))
  use("tibble", "as_tibble_col")
  use("dplyr")
  use("glue", "glue")
  use("purrr", c("map", "map_chr"))
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
  mutate(
    metafile = path(.data$input_dir, meta_parquet),
    meta = map(metafile, \(x) arrow::read_parquet(x)),
    input_id = map_chr(.data$meta, "input_id"),
    input_id_match = stopifnot(basename(.data$input_dir) == .data$input_id),
    output_id = map_chr(.data$meta, "output_id"),
    batch_date = map_chr(.data$output_id, \(x) {
      as.Date(ulid::unmarshal(x)$ts, tz = "UTC") |> as.character()
    }),
    s3_target = glue(
      "s3://{DATALAKE_BUCKET}/{DATALAKE_PREFIX}/",
      "batch_date={.data$batch_date}/",
      "portal_run_id={.data$input_id}/",
      "batch_id={.data$output_id}"
    ),
    cmd = glue("aws s3 sync --no-progress {.data$input_dir} {.data$s3_target}"),
    cmd_run = map(cmd, system)
  )
