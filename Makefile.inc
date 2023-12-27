# Project name, used to name the binaries
PROG := docker-machine-driver-vmware

# Location of the binaries
OUT_DIR := bin

# Whether to perform targets inside a docker container, or natively on the host
USE_CONTAINER ?=

# List of cross compilation targets
ifeq ($(TARGET_OS),)
  TARGET_OS := darwin linux windows
endif

ifeq ($(GO_ARCH),)
  GO_ARCH := darwin linux windows
endif

ifeq ($(TARGET_ARCH),)
  TARGET_ARCH := amd64 arm64
endif

# Output prefix, defaults to local directory if not specified
ifeq ($(PREFIX),)
  PREFIX := $(shell pwd)
endif
