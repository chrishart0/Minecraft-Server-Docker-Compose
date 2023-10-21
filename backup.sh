#!/bin/bash

# Check for necessary tools
if ! command -v tar &> /dev/null; then
    echo "Error: tar is not found. Please install it."
    exit 1
fi

# Create backups directory if it doesn't exist
BACKUP_DIR="./backups"
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p $BACKUP_DIR
    echo "Directory $BACKUP_DIR created."
fi

# Timestamp for the backup filename
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Creating the backup
tar -czvf "${BACKUP_DIR}/minecraft_backup_${TIMESTAMP}.tar.gz" ./minecraft

echo "Backup completed: ${BACKUP_DIR}/minecraft_backup_${TIMESTAMP}.tar.gz"
