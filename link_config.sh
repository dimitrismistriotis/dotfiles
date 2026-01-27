#!/usr/bin/env bash
# Helper script to remove and create symlinks for dotfiles
# Usage: ./scripts/link_config.sh "Description" "source_path" "destination_path" [--mkdir]

set -e

DESCRIPTION="$1"
SOURCE_PATH="$2"
DEST_PATH="$3"
CREATE_DIR="$4"

# Validate arguments
if [ -z "$DESCRIPTION" ] || [ -z "$SOURCE_PATH" ] || [ -z "$DEST_PATH" ]; then
    echo "Usage: $0 \"Description\" \"source_path\" \"destination_path\" [--mkdir]"
    echo "Example: $0 \"Ghostty Config\" \"\$(CURDIR)/dot_config/ghostty/config\" \"~/.config/ghostty/config\" --mkdir"
    exit 1
fi

# Expand tilde in destination path
DEST_PATH="${DEST_PATH/#\~/$HOME}"

echo "$DESCRIPTION"

# Create parent directory if --mkdir flag is provided
if [ "$CREATE_DIR" = "--mkdir" ]; then
    DEST_DIR=$(dirname "$DEST_PATH")
    mkdir -p "$DEST_DIR"
fi

# Remove existing file/symlink (use -f to avoid errors if it doesn't exist)
rm -f "$DEST_PATH"

# Create symlink
ln -s "$SOURCE_PATH" "$DEST_PATH"
