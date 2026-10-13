#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

TARGET_DIR="$1"

FILES_COUNT=$(find "$TARGET_DIR" -type f | wc -l)
DIRS_COUNT=$(find "$TARGET_DIR" -mindepth 1 -type d | wc -l)

echo "FILES: $FILES_COUNT"
echo "DIRS: $DIRS_COUNT"
echo "LARGEST:"
find "$TARGET_DIR" -type f -printf "%s %P\n" | sort -nr | head -n 3

echo "EXECUTABLE:"
find "$TARGET_DIR" -type f -executable -printf "%P\n" | sort

echo "EXTENSIONS:"
find "$TARGET_DIR" -type f -name "*.*" | sed 's/.*\.//' | sort | uniq -c | sort -nr | head -n 5 | awk '{print $1 " ." $2}'