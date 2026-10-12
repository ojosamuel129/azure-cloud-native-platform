#!/usr/bin/env bash
# Usage: ./count_errors.sh <logfile>
set -euo pipefail

file="${1:?Please provide a log file}"

if [[ ! -f "$file" ]]; then
 echo "Error: file not found: $file" >&2
 exit 1
fi

echo "ERROR lines in $file: $(grep -c ERROR "$file" || true)"
