#!/usr/bin/env bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

# Check required environment variables
if [[ ! -v NECESSE_PASSWORD ]]; then
  echo "NECESSE_PASSWORD must be set"
  exit 1
fi
if [[ ! -v NECESSE_WORLD ]]; then
  echo "NECESSE_WORLD must be set"
  exit 1
fi

# check /data volume
if [[ ! -d /data ]]; then
  echo "/data volume is mandatory"
  exit 1
fi

# execute CMD
exec "$@"