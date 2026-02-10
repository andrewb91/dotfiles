#!/bin/bash

# Script to display free disk space on all mounted local partitions
# Uses human-readable format (e.g., GB, TB)
# Excludes common pseudo-filesystems to avoid clutter

echo "Free Space on Mounted Partitions:"
echo "=================================="

df -h \
   --exclude-type=tmpfs \
   --exclude-type=devtmpfs \
   --exclude-type=squashfs \
   --exclude-type=iso9660 \
   | grep -v '^Filesystem'

echo "=================================="
