#!/data/data/com.termux/files/usr/bin/bash
REPO="https://github.com/ximimoments/katifetch-termux"
TMP_DIR="$PREFIX/tmp/katifetch-tmp"

echo "🔄 Checking for updates..."
rm -rf "$TMP_DIR"
git clone --depth=1 "$REPO" "$TMP_DIR" >/dev/null 2>&1 || { echo "❌ Failed"; exit 1; }

cp -r "$TMP_DIR/"* "$PWD/"
rm -rf "$TMP_DIR"

echo "✅ Katifetch updated successfully!"
