all: build

build:
	@docker build -t andreasfertig/cppinsights-docker-base `pwd`
