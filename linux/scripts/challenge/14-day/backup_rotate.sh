#!/bin/bash

set -u
SCRIPT_NAME="$(basename "$0")"
BACKUP_ROOT="${2:-/var/backups}"
SOURCE_DIR="${1:-}"
MAX_BACKUPS=5


if [[ -z "$SOURCE_DIR" ]]; then
    echo "[ERROR] Usage: $SCRIPT_NAME <source_dir> [backup_root]"
    exit 1
fi


if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "[ERROR] Source directory not found: $SOURCE_DIR"
    exit 1
fi

if [[ ! -r "$SOURCE_DIR" ]]; then
    echo "[ERROR] Source directory not readable: $SOURCE_DIR"
    exit 1
fi


SOURCE_NAME="$(basename "$SOURCE_DIR")"
TIMESTAMP="$(date +"%Y-%m-%d_%H-%M-%S")"
BACKUP_DIR="${BACKUP_ROOT}/${SOURCE_NAME}"
BACKUP_NAME="${SOURCE_NAME}_${TIMESTAMP}"
FULL_BACKUP_PATH="${BACKUP_DIR}/${BACKUP_NAME}"

mkdir -p "$BACKUP_DIR"

echo "[$SCRIPT_NAME] Source: $SOURCE_DIR"
echo "[$SCRIPT_NAME] Backup dir: $BACKUP_DIR"

echo "[$SCRIPT_NAME] Creating backup: $FULL_BACKUP_PATH"

cp -r "$SOURCE_DIR" "$FULL_BACKUP_PATH" || {
    echo "[ERROR] Backup failed. Check disk space and permissions."
    exit 1
}

SIZE="$(du -sh "$FULL_BACKUP_PATH" | cut -f1)"
echo "[$SCRIPT_NAME] Backup complete. Size: $SIZE"

COUNT=$(ls -dt "$BACKUP_DIR"/*/ 2>/dev/null | wc -l | tr -d ' ')

if [[ $COUNT -gt $MAX_BACKUPS ]]; then
    echo "[$SCRIPT_NAME] Total backups: $COUNT — rotating..."
    ls -dt "$BACKUP_DIR"/*/ 2>/dev/null | tail -n +"$(( MAX_BACKUPS + 1 ))"| while IFS= read -r old_backup; do
        rm -rf "$old_backup"
        echo "[$SCRIPT_NAME] Removed: $old_backup"
    done
    echo "[$SCRIPT_NAME] Rotation complete. Keeping $MAX_BACKUPS most recent backups."
else
    echo "[$SCRIPT_NAME] Total backups: $COUNT — no rotation needed."
fi



