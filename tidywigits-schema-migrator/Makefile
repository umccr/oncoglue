# Check if .env file exists
ifeq ($(wildcard .env),)
$(error .env file not found. Execution halted. Please create one from .env.example)
endif

# Include the .env file
include .env

# ---

install:
	@(cd .. && make install)

debug:
	@echo "RUN_ID: $(RUN_ID)"
	@echo "TIDYWIGITS_IMAGE_TAG: $(TIDYWIGITS_IMAGE_TAG)"
	@echo "LZ_BUCKET: $(LZ_BUCKET)"
	@echo "LZ_DBNAME: $(LZ_DBNAME)"
	@echo "ATHENA_WORKGROUP: $(ATHENA_WORKGROUP)"
	@echo "MODE: $(MODE)"
	@echo "DRY_RUN: $(DRY_RUN)"
	@echo "REGION_NAME: $(REGION_NAME)"

check:
	@aws glue get-database --name "$(LZ_DBNAME)"

run:
	@python3 migrator.py
