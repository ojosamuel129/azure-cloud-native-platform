#!/usr/bin/env bash
set -euo pipefail

src="${1:?Usage: $0 <source_dir> [dest_dir]}"
dest="${2:-$HOME/backups}"

if [[ ! -d "$src" ]]; then
  echo "Source not found: $src" >&2
  exit 1
fi

mkdir -p "$dest"
stamp=$(date +%Y%m%d-%H%M%S)
archive="$dest/$(basename "$src")-$stamp.tar.gz"
tar -czf "$archive" -C "$(dirname "$src")" "$(basename "$src")"
echo "Backup created: $archive"
