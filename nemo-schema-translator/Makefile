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
	@echo $(RUN_ID)
	@echo $(TIDYWIGITS_IMAGE_TAG)
	@echo $(LZ_BUCKET)/$(LZ_KEY_PREFIX)
	@echo $(LZ_DBNAME)

run:
	@python3 translator.py
