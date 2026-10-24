# Check if .env file exists
ifeq ($(wildcard .env),)
$(error .env file not found. Execution halted. Please create one from .env.example)
endif

# Include the .env file
include .env

# ---

debug:
	@echo $(NEMO_S3_INPUT)
	@echo $(NEMO_IMAGE_URL):$(NEMO_IMAGE_TAG)

.PHONY: dir
dir:
	@echo "./data/output/nemo/$(NEMO_IMAGE_TAG)/$(RUN_ID)"
	@mkdir -p "./data/input"
	@mkdir -p "./data/output/nemo/$(NEMO_IMAGE_TAG)/$(RUN_ID)"

# sync only files nemo parses; patterns are derived from the wigits tool schemas
sync: dir
	@docker compose run -q --rm nemo-sync sync -w wigits \
		-s $(NEMO_S3_INPUT) -d ./input/$(RUN_ID)

sync-dryrun: dir
	@docker compose run -q --rm nemo-sync sync -w wigits \
		-s $(NEMO_S3_INPUT) -d ./input/$(RUN_ID) --dryrun

# print the include/exclude patterns nemo passes to `aws s3 sync`
sync-patterns:
	@docker compose run -q -T --rm nemo-sync sync -w wigits \
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
	@docker compose run -q --rm nemo list -w wigits -f tsv -d ./input/$(RUN_ID)

tidy: dir
	@time docker compose run -q --rm nemo tidy -w wigits \
		-f parquet \
		-d ./input/$(RUN_ID) \
		-o ./output/nemo/$(NEMO_IMAGE_TAG)/$(RUN_ID) \
		--ulid --prefix_include --input_id $(RUN_ID)

run: tidy
