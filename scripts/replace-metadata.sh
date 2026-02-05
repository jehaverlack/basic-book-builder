#!/usr/bin/env bash
# Usage: scripts/replace-metadata.sh conf/metadata.yaml templates/source.file conf/destination.file
# Description:
#   Reads templates/source.file 
#   Replaces all $key$ with values from metadata.yaml
#   Writes result to conf/destination.file
# Requirements:
#   metadata.yaml must be flat (key: value)

set -euo pipefail

META_FILE="$1"
TEMPLATE_FILE="$2"
OUTPUT_FILE="$3"
TEMP_FILE="scripts/tmp/frontmatter.tmp"

# Check arguments
echo "  META_FILE: $META_FILE"
echo "  TEMPLATE_FILE: $TEMPLATE_FILE"
echo "  OUTPUT_FILE: $OUTPUT_FILE"
echo "  TEMP_FILE: $TEMP_FILE"
echo ""

# Start fresh output
cp "$TEMPLATE_FILE" "$OUTPUT_FILE"

# Load metadata into Bash associative array
declare -A META
while IFS= read -r line; do
    # skip empty or comment lines
    [[ -z "$line" || "$line" =~ ^# ]] && continue

    key=$(echo "$line" | cut -d ':' -f 1 | xargs)
    val=$(echo "$line" | cut -d ':' -f 2- | xargs)  # capture full value after first colon, trim spaces

    # strip surrounding quotes if present
    val="${val%\"}"
    val="${val#\"}"

    META["$key"]="$val"
done < "$META_FILE"

# Read template line by line and substitute
for key in "${!META[@]}"; do
    # Strip leading/trailing whitespace and quotes
    val="${META[$key]}"
    val="${val%\"}"   # remove trailing "
    val="${val#\"}"   # remove leading "
    val="$(echo "$val" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"  # trim spaces safely

    # Escape special chars for sed
    esc_val=$(printf '%s' "$val" | sed -e 's/[\/&$]/\\&/g')

    search_key="\$${key}\$"
    echo "  Replacing ${search_key} → ${val}"
    sed -i "s|\\\$${key}\\\$|${val}|g" "$OUTPUT_FILE"
    # ls -l "$OUTPUT_FILE"
done

echo "✅ Rendered: $OUTPUT_FILE"
