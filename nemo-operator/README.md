# Tidywigits Operator

The following is a step-by-step guide to operating the [tidywigits](https://github.com/tidywf/tidywigits) Operator.


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

We need an authenticated AWS session. 
Use your usual way of AWS CLI setup to authenticate.

For example:
```
export AWS_PROFILE=umccr-prod-operator
aws sso login
```

Sync the data.
```
make sync
```

Pull tidywigits image.
```
make pull
```

Run diagnostics targets.
```
make pwd
make ls
```

Check tidywigits version and help.
```
make version
make help
```

Make a call to the tidywigits list for parsable file listing.
```
make list
```

Redirect the parsable file list to a file.
```
make list > tidywigits_parsable_file_list.tsv
```

Run tidywigits tidy.
```
make tidy
```

## Next

* You change the `.env` that points to another `RUN_ID` and/or choose a different tidywigits version.
* You can delete anything under `./data` and start over.
