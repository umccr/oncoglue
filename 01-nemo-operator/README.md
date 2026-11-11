# Nemo Operator

The following is a step-by-step guide to operating the [nemo](https://github.com/tidywf/nemo) Operator.


## Prerequisites

* Docker Desktop
* AWS CLI
* GNU Make
* No Python or R setup is required.

## Steps

Copy the example environment file and adjust it.
```
cp -v .env.example .env
```

Run diagnostics debug target.
```
make debug
```

Make the directory layout.
```
make dir
```

Pull [nemo-image](https://github.com/tidywf/nemo-image) (bundles nemo + tidywigits + tidydragen).
```
make pull
```

We need an authenticated AWS session. 
Use your usual way of AWS CLI setup to authenticate.

For example:
```
export AWS_PROFILE=umccr-prod-operator
aws sso login
```

Sync the data via `nemo sync` in the container.

```
make sync
```

Preview what would be synced, or print the include/exclude patterns.
```
make sync-dryrun
make sync-patterns
```

Run diagnostics targets.
```
make pwd
make ls
```

Check nemo version and help.
```
make version
make help
```

Make a call to the nemo list for parsable file listing (`NEMO_WORKFLOW`: `wigits` or `dragen`).
```
make list
```

Redirect the parsable file list to a file.
```
make list > nemo_parsable_file_list.tsv
```

Run nemo tidy (`NEMO_WORKFLOW`: `wigits` or `dragen`).
```
make tidy
```

## Next

* You change the `.env` that points to another `RUN_ID` and/or choose a different nemo-image version (`NEMO_IMAGE_TAG`).
* You can delete anything under `./data` and start over.
