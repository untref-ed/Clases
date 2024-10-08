## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## install: install all required dependencies
.PHONY: install
install:
	pip install --requirement requirements.txt
	pip install --editable ./code

## fmt: format Python and Jupyter files
.PHONY: fmt
fmt:
	black --line-length 120 .
	find . -name "*.ipynb" -not -path "*.ipynb_checkpoints*" -exec jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace {} ';'
