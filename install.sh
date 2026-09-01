#!/usr/bin/env bash
set -euo pipefail

PREFIX="$HOME/4MRNA-Install"
BIN_DIR="$PREFIX/bin"
TMP_DIR="$PREFIX/tmp"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$BIN_DIR"
mkdir -p "$TMP_DIR"

echo "[4MRNA-Install] Installing into: $PREFIX"

install -m 0755 "$SCRIPT_DIR/4MRNA" "$BIN_DIR/4MRNA"

echo "Install Finished"
echo "(Add to PATH: export PATH=\"$BIN_DIR:\$PATH\")"
echo "Try: 4MRNA --version"
