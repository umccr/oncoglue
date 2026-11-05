# Check if .env file exists
ifeq ($(wildcard .env),)
$(error .env file not found. Execution halted. Please create one from .env.example)
endif

# Include the .env file
include .env

# nemo workflow: wigits or dragen; set in .env or override per call, e.g. `make run NEMO_WORKFLOW=dragen`
NEMO_WORKFLOW ?= wigits
ifeq ($(filter $(NEMO_WORKFLOW),wigits dragen),)
$(error NEMO_WORKFLOW must be one of: wigits, dragen (got '$(NEMO_WORKFLOW)'))
endif

# ---

install:
	@(cd .. && make install)

debug:
	@echo $(NEMO_WORKFLOW)
	@echo $(NEMO_IMAGE_TAG)

run:
	@python3 translator.py
