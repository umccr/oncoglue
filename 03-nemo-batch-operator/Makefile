# Check if .env file exists
ifeq ($(wildcard .env),)
$(error .env file not found. Execution halted. Please create one from .env.example)
endif

# Include the .env file
include .env

# ---

debug:
	@echo $(NEMO_IMAGE_URL):$(NEMO_IMAGE_TAG)
	@echo $(MANIFEST_CSV)

.PHONY: dir
dir:
	@echo "./data/output/nemo/$(NEMO_IMAGE_TAG)"
	@mkdir -p "./data/input"
	@mkdir -p "./data/output/nemo/$(NEMO_IMAGE_TAG)"

pull:
	@docker compose pull

# generate one `nemo tidy` line per manifest row; workflow is derived from each row's prefix
gen:
	@python gen.py > gen.sh

# generate one datalake push (datalake.py --execute --verify) per manifest row; run after gen.sh
gen-sync:
	@python gen.py --push > gen_sync.sh

# same, but datalake.py only prints the aws s3 sync commands
gen-sync-dryrun:
	@python gen.py --push --dryrun > gen_sync.sh
