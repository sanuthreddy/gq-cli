#!/bin/bash

set -e

echo "Adding gq..."
if sudo ln -sf "$(pwd)/gq" /usr/local/bin/gq; then
    echo "✓ Successfully added gq to /usr/local/bin/gq"
else
    echo "✗ Failed to add gq"
    exit 1
fi