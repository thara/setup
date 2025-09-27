SHELL := /bin/bash

.PHONY: macos
macos:
	@./macos/install.sh

ci_lint:
	@actionlint
	@pinact run --verify
	@ghalint run
