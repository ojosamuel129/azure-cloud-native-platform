#!/usr/bin/env bash
set -euo pipefail

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 file..." >&2
  exit 1
fi

for f in "$@"; do
  if [[ ! -f "$f" ]]; then
    echo "Skipping missing file: $f" >&2
    continue
  fi
  errors=$(grep -c ERROR "$f" || true)
  infos=$(grep -c INFO "$f" || true)
  echo "$f: ERROR=$errors INFO=$infos"
done
