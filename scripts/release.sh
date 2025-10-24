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

ENTRIES=$(cat "$(dirname "$0")/versions.json")

while read -r entry
do
  VERSION=$(echo "${entry}" | jq -r '.version')
  URL=$(echo "${entry}" | jq -r '.url')

  echo "${VERSION}: ${URL}"
  docker build --platform linux/amd64 -t "ghcr.io/docker-server-games/necesse:${VERSION}" --build-arg "NECESSE_VERSION=${VERSION}" .
done< <(echo "${ENTRIES}" | jq -c '.[]')