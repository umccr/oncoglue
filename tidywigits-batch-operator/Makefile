# Check if .env file exists
ifeq ($(wildcard .env),)
$(error .env file not found. Execution halted. Please create one from .env.example)
endif

# Include the .env file
include .env

# ---

debug:
	@echo $(TIDYWIGITS_IMAGE_URL):$(TIDYWIGITS_IMAGE_TAG)

.PHONY: dir
dir:
	@echo "./data/output/tidywigits/$(TIDYWIGITS_IMAGE_TAG)/$(RUN_ID)"
	@mkdir -p "./data/input"
	@mkdir -p "./data/output/tidywigits/$(TIDYWIGITS_IMAGE_TAG)/$(RUN_ID)"
	@mkdir -p "./data/output/tidywigits/$(TIDYWIGITS_IMAGE_TAG)/$(RUN_ID)/_metadata"
