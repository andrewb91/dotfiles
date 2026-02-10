#!/bin/bash
# weekly_timeshift_backup.sh
# Automates a weekly Timeshift backup if /dev/sda2 is mounted

# Check if /dev/sda2 is mounted
if mount | grep -q "/dev/sda2"; then
    echo "[INFO] /dev/sda2 is mounted. Proceeding with Timeshift backup."

    # Run Timeshift backup (requires sudo)
    # --create: create a snapshot
    # --comments: add a label to the snapshot
    # --tags: specify backup type (D = daily, W = weekly, M = monthly, O = on-demand, B = boot)
    sudo timeshift --create --comments "Automated weekly backup" --tags W

    if [ $? -eq 0 ]; then
        echo "[SUCCESS] Timeshift backup completed successfully."
    else
        echo "[ERROR] Timeshift backup failed."
        exit 1
    fi
else
    echo "[WARNING] /dev/sda2 is not mounted. Backup skipped."
    exit 1
fi
