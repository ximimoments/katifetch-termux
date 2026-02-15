#!/data/data/com.termux/files/usr/bin/bash
echo "Uninstalling Katifetch..."

INSTALL_PATH="$PREFIX/bin/katifetch"
CONFIG_FILE="$HOME/.katifetchrc"
SHARE_DIR="$PREFIX/share/katifetch"

[ -f "$INSTALL_PATH" ] && rm "$INSTALL_PATH" && echo "✔️ Executable removed"
[ -d "$SHARE_DIR" ] && rm -rf "$SHARE_DIR" && echo "✔️ Assets removed"

read -p "Remove config file ($CONFIG_FILE)? [y/N]: " answer
[[ "$answer" =~ ^[Yy]$ ]] && rm "$CONFIG_FILE" && echo "✔️ Config removed"

echo "✅ Katifetch uninstalled."
