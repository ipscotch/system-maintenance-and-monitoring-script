#!/bin/bash

# Directories and file types to clean
CLEANUP_DIRS=("/tmp" "/var/tmp")
FILE_AGE=7
LOG_FILE="/var/log/disk_cleanup.log"

# Cleanup files older than specified days
for dir in "${CLEANUP_DIRS[@]}"; do
    find $dir -type f -mtime +$FILE_AGE -exec rm -f {} \;
done

# Log cleanup activity
echo "$(date +'%Y-%m-%d %H:%M:%S') - Disk cleanup completed" >> $LOG_FILE
