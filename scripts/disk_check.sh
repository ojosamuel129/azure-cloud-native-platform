#!/usr/bin/env bash
set -euo pipefail

threshold="${1:-80}"
usage=$(df / --output=pcent | tail -1 | tr -dc '0-9')

echo "Root disk usage: ${usage}%"
if (( usage >= threshold )); then
  echo "WARNING: usage is at or above ${threshold}%" >&2
  exit 1
fi
echo "OK: below ${threshold}%"
