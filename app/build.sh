#!/usr/bin/env bash

set -euo pipefail
set -o xtrace

NECESSE_ZIP="necesse-server-linux64-${NECESSE_VERSION}.zip"
NECESSE_URL="https://necessegame.com/content/server/${NECESSE_VERSION}/${NECESSE_ZIP}"

wget "${NECESSE_URL}"
unzip "${NECESSE_ZIP}"
rm "${NECESSE_ZIP}"

NECESSE_FOLDER="necesse-server-${NECESSE_VERSION}"

mv "${NECESSE_FOLDER}" "server"
chmod +x server/*.sh
chmod +x server/jre/bin/*

#wget https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64
#mv ./ttyd.x86_64 ./ttyd
#chmod +x ./ttyd
