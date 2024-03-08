all: build

ARGS :=

build:
	@docker buildx build $(ARGS) --platform linux/arm64,linux/amd64 -t andreasfertig/cppinsights-docker-base `pwd`

