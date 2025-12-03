#!/bin/bash
# Daily Log Cleaner. Finds errors and warnings.

# Check if you gave a file
if [ $# -ne 1 ]; then
    echo "Usage: ./clean-log.sh your-log-file.log"
    exit 1
fi

LOGFILE=$1
CLEANFILE="clean_${LOGFILE}"

# Find errors/warnings and save to new file
grep -i -E "error|warning" "$LOGFILE" > "$CLEANFILE"

# Count how many we found
COUNT=$(wc -l < "$CLEANFILE")

# Show summary
echo "✅ Done! Found $COUNT errors/warnings."
echo "Check the clean file: $CLEANFILE"
