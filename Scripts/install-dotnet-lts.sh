#!/bin/bash
set -e

ARCH="arm64"
SDK_VERSION="8.0.412"
INSTALL_DIR="$HOME/.dotnet"
TMPDIR=$(mktemp -d)
cd "$TMPDIR"

echo "🔍 Looking up download URL for .NET SDK $SDK_VERSION (Linux $ARCH)..."

RELEASES_JSON="https://dotnetcli.blob.core.windows.net/dotnet/release-metadata/8.0/releases.json"

SDK_URL=$(curl -s "$RELEASES_JSON" | jq -r \
  --arg ver "$SDK_VERSION" \
  --arg arch "$ARCH" '
  .releases[]
  | select(.sdk.version == $ver)
  | .sdk.files[]
  | select(.rid == "linux-" + $arch and (.url? // "" | endswith(".tar.gz")))
  | .url')

if [[ -z "$SDK_URL" ]]; then
  echo "❌ Could not find .tar.gz for version $SDK_VERSION and arch $ARCH"
  exit 1
fi

FILENAME=$(basename "$SDK_URL")

echo "⬇ Downloading $FILENAME..."
curl -LO "$SDK_URL"

echo
if [ -d "$INSTALL_DIR" ]; then
  echo "⚠️ Directory $INSTALL_DIR already exists."
  read -p "Remove it and install new SDK? [y/N]: " yn
  [[ "$yn" =~ ^[Yy]$ ]] || { echo "❌ Installation cancelled."; exit 1; }
  rm -rf "$INSTALL_DIR"
fi

echo "📦 Extracting SDK to $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"
tar -xzf "$FILENAME" -C "$INSTALL_DIR"

echo
echo "✅ .NET SDK $SDK_VERSION installed to: $INSTALL_DIR"
echo "📌 Add this to your shell config:"
echo 'export DOTNET_ROOT="$HOME/dotnet"'
echo 'export PATH="$DOTNET_ROOT:$PATH"'
