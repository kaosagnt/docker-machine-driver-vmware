module github.com/machine-drivers/docker-machine-driver-vmware

go 1.23

require (
	golang.org/x/crypto v0.31.0
	golang.org/x/sys v0.28.0
)

replace github.com/docker/machine v0.16.2 => /go/src/github.com/kaosagnt/docker-machine
