#!/usr/bin/env bash
set -euo pipefail
echo "Running backup.sh"
SRC=${1:-"$HOME"}
DEST=${2:-"./backups"}
TIMESTAMP=$(date +%F_%H%M%S)
FNAME="backup_$(basename "$SRC")_${TIMESTAMP}.tar.gz"
echo "Source: $SRC"
echo "Destination: $DEST"
mkdir -p "$DEST"
tar -czf "${DEST}/${FNAME}" -C "$(dirname "$SRC")" "$(basename "$SRC")"
echo "Backup created: ${DEST}/${FNAME}"
