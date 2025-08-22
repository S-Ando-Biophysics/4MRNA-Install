#!/usr/bin/env bash
set -euo pipefail

ASSET_URL_LATEST="https://github.com/S-Ando-Biophysics/4MRNA/releases/latest/download/4MRNA.sh"
TAG="${TAG:-}"

PREFIX="$HOME/4MRNA-Install"
BIN_DIR="$PREFIX/bin"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$BIN_DIR"

echo "[4MRNA-Install] Installing into: $PREFIX"

TMP="$(mktemp)"
if [[ -n "$TAG" ]]; then
  echo "[4MRNA-Install] Downloading 4MRNA.sh (tag: $TAG)"
  curl -fsSL "https://github.com/S-Ando-Biophysics/4MRNA/releases/download/${TAG}/4MRNA.sh" -o "$TMP"
  echo "$TAG" > "$PREFIX/VERSION"
else
  echo "[4MRNA-Install] Downloading 4MRNA.sh (latest)"
  curl -fsSL "$ASSET_URL_LATEST" -o "$TMP"
  FINAL_URL="$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/S-Ando-Biophysics/4MRNA/releases/latest)"
  echo "${FINAL_URL##*/}" > "$PREFIX/VERSION"
fi
install -m 0755 "$TMP" "$PREFIX/4MRNA.sh"
rm -f "$TMP"

install -m 0755 "$SCRIPT_DIR/4MRNA" "$BIN_DIR/4MRNA"

echo "Install Finished"
echo "(Add to PATH: export PATH=\"$BIN_DIR:\$PATH\")"
echo "Try: 4MRNA version"

