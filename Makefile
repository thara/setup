SHELL := /bin/bash

.PHONY: macos
macos:
	@./macos/install.sh

.PHONY: macos_lint
macos_lint:
	@shellcheck ./macos/install.sh

.PHONY: ci_lint
ci_lint:
	@actionlint
	@pinact run --verify
	@ghalint run
