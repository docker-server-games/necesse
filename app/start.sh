set -euo pipefail

set -o xtrace

SERVER_ARGS=(
  "$@"
  -password "${NECESSE_PASSWORD}"
  -world "${NECESSE_WORLD}"
  -datadir /data
)

if [[ -v NECESSE_PORT ]]; then
  SERVER_ARGS+=(-port "${NECESSE_PORT}")
fi

if [[ -v NECESSE_SLOTS ]]; then
  SERVER_ARGS+=(-slots "${NECESSE_SLOTS}")
fi

if [[ -v NECESSE_OWNER ]]; then
  SERVER_ARGS+=(-owner "${NECESSE_OWNER}")
fi

if [[ -f /motd.txt ]]; then
  SERVER_ARGS+=(-motd "$(cat /motd.txt)")
fi

if [[ -v NECESSE_PAUSE_WHEN_EMPTY ]]; then
  SERVER_ARGS+=(-pausewhenempty "${NECESSE_PAUSE_WHEN_EMPTY}")
fi

if [[ -v NECESSE_GIVE_CLIENTS_POWER ]]; then
  SERVER_ARGS+=(-giveclientspower "${NECESSE_GIVE_CLIENTS_POWER}")
fi

if [[ -v NECESSE_LOGGING ]]; then
  SERVER_ARGS+=(-logging "${NECESSE_LOGGING}")
fi

if [[ -v NECESSE_ZIP_SAVES ]]; then
  SERVER_ARGS+=(-zipsaves "${NECESSE_ZIP_SAVES}")
fi

if [[ -v NECESSE_LANGUAGE ]]; then
  SERVER_ARGS+=(-language "${NECESSE_LANGUAGE}")
fi

#TTYD_ARGS=()
#
#if [[ -v TTYD_PORT ]]; then
#  TTYD_ARGS+=(--port "${TTYD_PORT}")
#fi
#
#if [[ -v TTYD_WRITABLE && "${TTYD_WRITABLE}" == "1" ]]; then
#  TTYD_ARGS+=(--writable)
#fi
#
#if [[ -v TTYD_CREDENTIAL ]]; then
#  TTYD_ARGS+=(--credential "${TTYD_CREDENTIAL}")
#fi

#exec /app/ttyd "${TTYD_ARGS[@]}" /app/server/StartServer-nogui.sh "${SERVER_ARGS[@]}"

exec /app/server/StartServer-nogui.sh "${SERVER_ARGS[@]}"