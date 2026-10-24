# Nemo Query Examples
  
Depending on the hat you are wearing (Systems Engineer, Data Scientist, Data Engineer), querying parquet files can go from a mild setup to a more involved platform setup. This module demonstrates and provides quick starter examples for querying parquet files output by nemo (wigits workflow) using some popular tools such as duckdb, pyarrow, etc. It also facilitates an operator to glimpse into parquet files after a tidy process is performed using the [operator module](../nemo-operator).

<!-- TOC -->
* [Nemo Query Examples](#nemo-query-examples)
  * [base](#base)
  * [notebooks](#notebooks)
  * [parquet-cli](#parquet-cli)
  * [duckdb-cli](#duckdb-cli)
<!-- TOC -->

## base

```
# match NEMO_IMAGE_TAG and RUN_ID in your nemo-operator .env
export BASE=../nemo-operator/data/output/nemo/0.1.1
export RUN_ID=202610214dcf2129

ls $BASE
202610214dcf2129
```

## notebooks

The following are a demonstration for EDA (exploratory data analysis) style notebooks. Something to try as a kick-starter.

Set up the Python environment and run the notebook like so:

```
conda create -n oncoglue python=3.13
conda activate oncoglue

pip install notebook
cd nemo-query-examples
jupyter notebook
```

* [notebook_duckdb.ipynb](notebook_duckdb.ipynb) (Python: duckdb, pyarrow)
* [notebook_duckdb.qmd](notebook_duckdb.qmd) (R/Quarto: duckdb, duckplyr): `quarto render notebook_duckdb.qmd`

## parquet-cli

https://formulae.brew.sh/formula/parquet-cli

```
brew install parquet-cli
```

```
parquet meta $BASE/$RUN_ID/metadata.parquet
parquet schema $BASE/$RUN_ID/metadata.parquet

parquet help footer
parquet footer $BASE/$RUN_ID/*_purple_qc.parquet | less

parquet help scan
parquet scan $BASE/$RUN_ID/*_purple_cnvgenetsv.parquet

    Scanned 39073 records from 1 file(s)
    Time: 0.469 s

parquet help head
parquet head $BASE/$RUN_ID/*_purple_cnvgenetsv.parquet | jq

parquet help cat
parquet cat -n 10 $BASE/$RUN_ID/*_purple_cnvgenetsv.parquet | jq
```

## duckdb-cli

https://formulae.brew.sh/formula/duckdb

```
brew install duckdb
```

```
duckdb -c "SELECT count(1) FROM '$BASE/$RUN_ID/*_purple_cnvgenetsv.parquet'"
┌──────────┐
│ count(1) │
│  int64   │
├──────────┤
│    39073 │
└──────────┘
```

```
duckdb -c "DESCRIBE TABLE '$BASE/$RUN_ID/*_purple_qc.parquet'"
┌──────────────────────────────────────────────────────────────────────────────┐
│ ../nemo-operator/data/output/nemo/0.1.1/202610214dcf2129/*_purple_qc.parquet │
│                                                                              │
│ input_id                                                             varchar │
│ input_prefix                                                         varchar │
│ output_id                                                            varchar │
│ qc_status                                                            varchar │
│ method                                                               varchar │
│ cn_segments                                                          integer │
│ cn_segments_unsupported                                              integer │
│ purity                                                               double  │
│ gender_amber                                                         varchar │
│ gender_cobalt                                                        varchar │
│ deleted_genes                                                        integer │
│ contamination                                                        double  │
│ germline_aberrations                                                 varchar │
│ mean_depth_amber                                                     double  │
│ loh_percent                                                          double  │
│ tinc_level                                                           double  │
│ chimerism_percent                                                    double  │
└──────────────────────────────────────────────────────────────────────────────┘
```
