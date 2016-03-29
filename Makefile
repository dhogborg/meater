
.PHONY: build clean

VERSION = $(shell git describe --always --dirty)
TIMESTAMP = $(shell git show -s --format=%ct)

default: build

build:
	docker build -t dhogborg/meater:latest .

run: 
	docker run -ti --rm -e URL=$URL dhogborg/meater:latest