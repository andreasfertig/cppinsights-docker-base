all: build

build:
	@docker build -t cppinsights-docker-base `pwd`
