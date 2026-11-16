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

# One database per workflow: tidywigits, tidydragen
LZ_DBNAME := tidy$(NEMO_WORKFLOW)

# ---

install:
	@(cd .. && make install)

debug:
	@echo "NEMO_WORKFLOW: $(NEMO_WORKFLOW)"
	@echo "SCHEMA_VERSION_WIGITS: $(SCHEMA_VERSION_WIGITS)"
	@echo "SCHEMA_VERSION_DRAGEN: $(SCHEMA_VERSION_DRAGEN)"
	@echo "LZ_BUCKET: $(LZ_BUCKET)"
	@echo "LZ_DBNAME: $(LZ_DBNAME)"
	@echo "ATHENA_WORKGROUP: $(ATHENA_WORKGROUP)"
	@echo "MODE: $(MODE)"
	@echo "DRY_RUN: $(DRY_RUN)"
	@echo "REGION_NAME: $(REGION_NAME)"

check:
	@aws glue get-database --region "$(REGION_NAME)" --name "$(LZ_DBNAME)"

database:
	@aws glue create-database \
		--region "$(REGION_NAME)" \
    	--database-input "{\"Name\":\"$(LZ_DBNAME)\"}"

create: database

run:
	@python3 migrator.py
