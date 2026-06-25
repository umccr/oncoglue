# TidyWigits Query Examples
  
Depends on the hat you are wearing (Systems Engineer, Data Scientist, Data Engineer), querying parquet files can go from mild setup to more involving platform setup. This module demonstrates and provides quick starter examples for querying tidywigits output parquet files using some popular tools such as duckdb, pyarrow, etc. It also facilitates an operator to make a glimpse into parquet files after a tidy process is performed using the [operator module](../tidywigits-operator).

<!-- TOC -->
* [TidyWigits Query Examples](#tidywigits-query-examples)
  * [base](#base)
  * [notebooks](#notebooks)
  * [parquet-cli](#parquet-cli)
  * [duckdb-cli](#duckdb-cli)
<!-- TOC -->

## base

```
export BASE=../tidywigits-operator/data/output/tidywigits/0.0.7.9005/

ls $BASE
2025091002d1f664 202509100539df0e
```

## notebooks

The followings are demonstration for EDA (exploratory data analysis) style notebooks. Something to try as a kick-starter.

Set up the Python environment and run the notebook like so:

```
conda create -n oncoglue python=3.13
conda activate oncoglue

pip install notebook
cd tidywigits-query-examples
jupyter notebook
```

* [notebook_duckdb.ipynb](notebook_duckdb.ipynb)

## parquet-cli

https://formulae.brew.sh/formula/parquet-cli

```
brew install parquet-cli
```

```
parquet meta $BASE/2025091002d1f664/metadata.parquet
parquet schema $BASE/2025091002d1f664/metadata.parquet

parquet help footer
parquet footer $BASE/2025091002d1f664/L2401549_purple_qc.parquet | less

parquet help scan
parquet scan $BASE/2025091002d1f664/L2401549_purple_cnvgenetsv.parquet

    Scanned 39073 records from 1 file(s)
    Time: 0.469 s

parquet help head
parquet head $BASE/2025091002d1f664/L2401549_purple_cnvgenetsv.parquet | jq

parquet help cat
parquet cat -n 10 $BASE/2025091002d1f664/L2401549_purple_cnvgenetsv.parquet | jq
```

## duckdb-cli

https://formulae.brew.sh/formula/duckdb

```
brew install duckdb
```

```
duckdb -c "SELECT count(1) FROM '$BASE/2025091002d1f664/L2401549_purple_cnvgenetsv.parquet'"
┌──────────┐
│ count(1) │
│  int64   │
├──────────┤
│    39073 │
└──────────┘
```

```
duckdb -c "DESCRIBE TABLE '$BASE/2025091002d1f664/L2401549_purple_qc.parquet'"
┌───────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ ../tidywigits-operator/data/output/tidywigits/0.0.7.9005//2025091002d1f664/L2401549_purple_qc.parquet │
│                                                                                                       │
│ input_id                                                                                      varchar │
│ input_prefix                                                                                  varchar │
│ output_id                                                                                     varchar │
│ qc_status                                                                                     varchar │
│ method                                                                                        varchar │
│ cn_segments                                                                                   integer │
│ cn_segments_unsupported                                                                       integer │
│ purity                                                                                        double  │
│ gender_amber                                                                                  varchar │
│ gender_cobalt                                                                                 varchar │
│ deleted_genes                                                                                 integer │
│ contamination                                                                                 double  │
│ germline_aberrations                                                                          varchar │
│ mean_depth_amber                                                                              double  │
│ loh_percent                                                                                   double  │
│ tinc_level                                                                                    double  │
│ chimerism_percent                                                                             double  │
└───────────────────────────────────────────────────────────────────────────────────────────────────────┘
```
