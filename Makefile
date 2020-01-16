META_VERSION ?= top10
KALI_VERSION ?= kali-linux-$(META_VERSION)
DOCKERFILE ?= Dockerfile
DOCKERFILE_V ?= $(DOCKERFILE).$(META_VERSION)
VOLUME ?= $(HOME)/kali
IP ?= $(shell ipconfig getifaddr en0)

default: run

all: build run

build:
ifeq (,$(wildcard $(KALI_VERSION)))
	@ln -s $(DOCKERFILE_V) $(DOCKERFILE)
endif

	@docker build -t $(KALI_VERSION) .
	@docker container prune --force
	@rm $(DOCKERFILE)

run:
	@xhost + $(IP)
	@docker run \
		--rm \
		-e DISPLAY=$(IP):0 \
		--net="host" \
		--privileged \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v $(VOLUME):/kali \
		-it $(KALI_VERSION) /bin/bash


