# Check if .env file exists
ifeq ($(wildcard .env),)
$(error .env file not found. Execution halted. Please create one from .env.example)
endif

# Include the .env file
include .env

# nemo workflow: wigits or dragen; set in .env or override per call, e.g. `make tidy NEMO_WORKFLOW=dragen`
NEMO_WORKFLOW ?= wigits
ifeq ($(filter $(NEMO_WORKFLOW),wigits dragen),)
$(error NEMO_WORKFLOW must be one of: wigits, dragen (got '$(NEMO_WORKFLOW)'))
endif

# ---

debug:
	@echo $(NEMO_WORKFLOW)
	@echo $(NEMO_S3_INPUT)
	@echo $(NEMO_IMAGE_URL):$(NEMO_IMAGE_TAG)

.PHONY: dir
dir:
	@echo "./data/output/nemo/$(NEMO_IMAGE_TAG)/$(RUN_ID)"
	@mkdir -p "./data/input"
	@mkdir -p "./data/output/nemo/$(NEMO_IMAGE_TAG)/$(RUN_ID)"

# sync only files nemo parses; patterns are derived from the workflow's tool schemas
sync: dir
	@docker compose run -q --rm nemo-sync sync -w $(NEMO_WORKFLOW) \
		-s $(NEMO_S3_INPUT) -d ./input/$(RUN_ID)

sync-dryrun: dir
	@docker compose run -q --rm nemo-sync sync -w $(NEMO_WORKFLOW) \
		-s $(NEMO_S3_INPUT) -d ./input/$(RUN_ID) --dryrun

# print the include/exclude patterns nemo passes to `aws s3 sync`
sync-patterns:
	@docker compose run -q -T --rm nemo-sync sync -w $(NEMO_WORKFLOW) \
		-s $(NEMO_S3_INPUT) -d ./input/$(RUN_ID) --show_patterns -q

pull:
	@docker compose pull

# image ENTRYPOINT is nemo.R; override it for plain shell commands
pwd:
	@docker compose run -q --rm --entrypoint pwd nemo

ls:
	@docker compose run -q --rm --entrypoint ls nemo -l
	@echo "------ input ------"
	@docker compose run -q --rm --entrypoint ls nemo input/
	@echo "------ output ------"
	@docker compose run -q --rm --entrypoint ls nemo output/nemo/$(NEMO_IMAGE_TAG)/$(RUN_ID)

help:
	@echo "------ version ------"
	@docker compose run -q --rm nemo --version
	@echo "------ help ------"
	@docker compose run -q --rm nemo --help
	@echo "------ tidy help ------"
	@docker compose run -q --rm nemo tidy --help

version: help

list:
	@docker compose run -q --rm nemo list -w $(NEMO_WORKFLOW) -f tsv -d ./input/$(RUN_ID)

tidy: dir
	@time docker compose run -q --rm nemo tidy -w $(NEMO_WORKFLOW) \
		-f parquet \
		-d ./input/$(RUN_ID) \
		-o ./output/nemo/$(NEMO_IMAGE_TAG)/$(RUN_ID) \
		--ulid --prefix_include --input_id $(RUN_ID)

run: tidy
