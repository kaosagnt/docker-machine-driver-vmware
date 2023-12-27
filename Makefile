include Makefile.inc

GOOS ?= $(shell go env GOOS)
GOARCH ?= $(shell go env GOARCH)

ifeq ($(GOOS),windows)
	BIN_SUFFIX := ".exe"
endif

.PHONY: build
build:
	go mod tidy
	go build -o $(OUT_DIR)/$(PROG)-$(GOOS)-$(GOARCH)$(BIN_SUFFIX) ./

.PHONY: dep
dep:
	dep ensure

.PHONY: test
test:
	go test -race ./...

.PHONY: check
check:
	gofmt -l -s -d pkg/ cmd/
	go tool vet pkg/ cmd/

.PHONY: integration
integration:
ifeq ($(GOOS),windows)
else
	hack/integration.sh
endif
