#!/usr/bin/env bash
# Usage: scripts/new-project.sh <project-directory>
set -euo pipefail

# Check arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <project-directory>"
    exit 1
fi

# Create project directory
PROJECT_DIR="$1"
mkdir -p "$PROJECT_DIR"

