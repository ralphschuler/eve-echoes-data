#!/bin/bash

# Build docker image
docker build -t debug . && docker run -it --rm -e ARCH=Linux -v $(PWD)/data:/data --name debug debug