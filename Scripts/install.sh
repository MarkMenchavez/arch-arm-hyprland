#!/bin/bash

# File containing package names
PKG_FILE="package.lst"

# Check if yay is installed
if ! command -v yay &> /dev/null; then
    echo "Error: 'yay' is not installed. Please install it first."
    exit 1
fi

echo "Syncing official package databases..."
sudo pacman -Sy

# Parse the package file:
# - Strip inline and full-line comments
# - Ignore empty lines
mapfile -t packages < <(sed 's/#.*//' "$PKG_FILE" | awk 'NF')

if [ ${#packages[@]} -eq 0 ]; then
    echo "No packages to install. Please check $PKG_FILE"
    exit 0
fi

# Install all packages in a single yay call
#echo "Installing packages: ${packages[*]}"
yay -S --needed --noconfirm "${packages[@]}"

