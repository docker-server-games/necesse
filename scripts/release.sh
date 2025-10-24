#!/usr/bin/env bash

# https://necessegame.com/server/
#
# document.querySelectorAll('a')
#   .filter(a => a.getAttribute('href').startsWith('/content/server') && a.textContent.startsWith('Linux'))
#   .map(a => a.href)
#   .map(url => ({version: url.split('/')[5], url}))
#   .reverse()
#
# Gives a list of {version, url} objects in ascending order.
#
# It has been serialized to JSON, and saved under `scripts/versions.json` file
#
# Script prerequisite
# docker login ghcr.io -u <your_username>

ENTRIES=$(cat "$(dirname "$0")/versions.json")

while read -r entry
do
  VERSION=$(echo "${entry}" | jq -r '.version')
  URL=$(echo "${entry}" | jq -r '.url')
  DOCKER_TAG="ghcr.io/docker-server-games/necesse:${VERSION}"

  echo "${VERSION}: ${URL}"
  docker build --platform linux/amd64 -t "${DOCKER_TAG}" --build-arg "NECESSE_VERSION=${VERSION}" .
  docker image push "${DOCKER_TAG}"
done< <(echo "${ENTRIES}" | jq -c '.[]')