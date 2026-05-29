# Check if .env file exists
ifeq ($(wildcard .env),)
$(error .env file not found. Execution halted. Please create one from .env.example)
endif

# Include the .env file
include .env

# ---

debug:
	@echo $(RUN_ID)
	@echo $(ONCOANALYSER_WGTS_DNA_SRC)
	@echo $(ONCOANALYSER_WGTS_DNA_DST)
	@echo $(TIDYWIGITS_IMAGE_URL):$(TIDYWIGITS_IMAGE_TAG)

.PHONY: dir
dir:
	@echo "./data/output/tidywigits/$(TIDYWIGITS_IMAGE_TAG)/$(RUN_ID)"
	@mkdir -p "./data/input"
	@mkdir -p "./data/output/tidywigits/$(TIDYWIGITS_IMAGE_TAG)/$(RUN_ID)"
	@mkdir -p "./data/output/tidywigits/$(TIDYWIGITS_IMAGE_TAG)/$(RUN_ID)/_metadata"

sync: dir
	@aws s3 sync --no-progress $(ONCOANALYSER_WGTS_DNA_SRC) $(ONCOANALYSER_WGTS_DNA_DST) \
		--exclude "*.bam" \
		--exclude "*.bam.bai" \
		--exclude "*.vcf.gz" \
		--exclude "*.vcf.gz.tbi" \
		--exclude "*.vcf" \
		--exclude "*.circos" \
		--exclude "*.png" \
		--exclude "*.err" \
		--exclude "*.out" \
		--exclude "*.run" \
		--exclude "*.sh" \
		--exclude ".nextflow/*"

pull:
	@docker compose pull

pwd:
	@docker compose run -q --rm tidywigits pwd

ls:
	@docker compose run -q --rm tidywigits ls -l
	@echo "------ input ------"
	@docker compose run -q --rm tidywigits ls input/
	@echo "------ output ------"
	@docker compose run -q --rm tidywigits ls output/tidywigits/$(TIDYWIGITS_IMAGE_TAG)/$(RUN_ID)

help:
	@echo "------ version ------"
	@docker compose run -q --rm tidywigits tidywigits.R --version
	@echo "------ help ------"
	@docker compose run -q --rm tidywigits tidywigits.R --help
	@echo "------ tidy help ------"
	@docker compose run -q --rm tidywigits tidywigits.R tidy --help

version: help

list:
	@docker compose run -q --rm tidywigits tidywigits.R list -f tsv -d ./input/$(RUN_ID)

tidy: dir
	@time docker compose run -q --rm tidywigits tidywigits.R tidy \
		-f parquet \
		-d ./input/$(RUN_ID) \
		-o ./output/tidywigits/$(TIDYWIGITS_IMAGE_TAG)/$(RUN_ID) \
		--ulid --prefix_include --input_id $(RUN_ID)
