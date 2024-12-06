#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_log> <destination_log> <search_string>"
    exit 1
fi

# Assign command-line arguments to variables
SOURCE_LOG="$1"
DEST_LOG="$2"
SEARCH_STRING="$3"

# Ensure the source log file exists
if [ ! -f "$SOURCE_LOG" ]; then
    echo "Source log file '$SOURCE_LOG' does not exist."
    exit 1
fi

# Ensure the destination log file exists or create it
touch "$DEST_LOG"

# Monitor the source log file for new entries containing the search string
tail -F "$SOURCE_LOG" | grep --line-buffered "$SEARCH_STRING" >> "$DEST_LOG"
