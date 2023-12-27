module github.com/machine-drivers/docker-machine-driver-vmware

go 1.21

require (
	golang.org/x/crypto v0.14.0
	golang.org/x/sys v0.13.0
)

replace github.com/docker/machine v0.16.2 => /go/src/github.com/kaosagnt/docker-machine
