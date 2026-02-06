#!/usr/bin/env bash
set -euo pipefail

# Check arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <project-directory>"
    exit 1
fi

# Resolve directories
PROJECT_DIR="$1"
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
B3_DIR="$( cd -- "$SCRIPT_DIR/.." >/dev/null 2>&1 && pwd )"

mkdir -p "$PROJECT_DIR"

# echo "Script dir: $SCRIPT_DIR"
# echo "Template root: $B3_DIR"

# Copy template (excluding .git)
rsync -av --exclude ".git" "$B3_DIR/" "$PROJECT_DIR"
