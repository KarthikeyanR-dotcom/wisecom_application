#!/bin/bash

SOURCE_DIR="/ssd/export/dev/bin"
REMOTE_USER="karthik_kr"
REMOTE_HOST="my_remote_host"
REMOTE_DIR="/ssdRemote/export/dev/bin"
LOG_FILE="/applications/standalone/logs/backup_report.log"
BACKUP_TYPE="Remote Server"

timestamp() {
    date +"%Y-%m-%d %H:%M:%S"
}

perform_backup() {
    rsync -avz --delete "$SOURCE_DIR" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
    return $?
}

log_result() {
    if [ $1 -eq 0 ]; then
        echo "$(timestamp) - SUCCESS: Backup to $BACKUP_TYPE completed successfully." >> "$LOG_FILE"
    else
        echo "$(timestamp) - ERROR: Backup to $BACKUP_TYPE failed!" >> "$LOG_FILE"
    fi
}

perform_backup
log_result $?

