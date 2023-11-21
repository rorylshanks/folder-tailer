#!/bin/bash
TAG="${TAG:-latest}"
npm i -g pkg
pkg app.js --targets=latest-linuxstatic-x64 -o build/folder-tailer-linux-amd64
pkg app.js --targets=latest-linuxstatic-arm64 -o build/folder-tailer-linux-arm64
pkg app.js --targets=latest-macos-x64 -o build/folder-tailer-macos-amd64
pkg app.js --targets=latest-win-x64 -o build/folder-tailer-win-amd64

DOCKER_REPO="rorylshanks"
DOCKER_IMAGE_NAME="folder-tailer"
TARGET_ARCHS="linux/amd64,linux/arm64"

docker buildx create --use
docker buildx build --platform ${TARGET_ARCHS} -t ${DOCKER_REPO}/${DOCKER_IMAGE_NAME}:${TAG} -t ${DOCKER_REPO}/${DOCKER_IMAGE_NAME}:latest --push .