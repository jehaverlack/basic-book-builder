#!/usr/bin/env bash
# Usage: scripts/new-project.sh <project-directory>
set -euo pipefail

# Check arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <project-directory>"
    exit 1
fi

# Gets Script Directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
B3_DIR=$( cd -- "$( dirname -- "$SCRIPT_DIR/.." )" &> /dev/null && pwd )

# Create project directory
PROJECT_DIR="$1"
mkdir -p "$PROJECT_DIR"

echo "$SCRIPT_DIR"
echo "$B3_DIR"

# Copy B3 template to project directory
#rsync -av --exclude ".git" "$B3_DIR/" "$PROJECT_DIR"
