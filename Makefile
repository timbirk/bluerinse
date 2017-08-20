export GO15VENDOREXPERIMENT=1

exe = github.com/timbirk/rinser
pkgs = $(shell glide novendor)
cmd = rinser

TRAVIS_TAG ?= "0.0.0"
BUILD_DIR=build
COVERAGE_DIR=${BUILD_DIR}/coverage
GODEP=$(GOPATH)/bin/godep

.PHONY: all
all: clean deps build

.PHONY: deps
deps:
	go get -u github.com/Masterminds/glide
	glide install

.PHONY: clean
clean:
	rm -rfv ./$(BUILD_DIR)

.PHONY: build
build:
	CGO_ENABLED=0 go build -ldflags "-X main.version=$(TRAVIS_TAG) -s -w" -o $(BUILD_DIR)/$(cmd) $(exe)/cmd/$(cmd)
