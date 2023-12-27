FROM golang:1.21

RUN apt-get update && apt-get install -y --no-install-recommends \
                openssh-client \
                rsync \
                fuse3 \
                sshfs \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /go/src/github.com/kaosagnt

ENV DM_VER 0.16.2-gitlab.23-t2d.5

RUN wget -O docker-machine.tgz \
	"https://github.com/kaosagnt/docker-machine/archive/v${DM_VER}.tar.gz" \
	&& tar -xzf docker-machine.tgz \
	&& mv "docker-machine-${DM_VER}" docker-machine

ENV USER root

WORKDIR /go/src/github.com/machine-drivers/docker-machine-driver-vmware

COPY . ./
