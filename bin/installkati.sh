#!/data/data/com.termux/files/usr/bin/bash
set -e

PREFIX=${PREFIX:-/data/data/com.termux/files/usr}
INSTALL_DIR="$PREFIX/bin"
SHARE_DIR="$PREFIX/share/katifetch"
THEME_DIR="$SHARE_DIR/themes"
LOGO_DIR="$SHARE_DIR/logos"
BADAPPLE_DIR="$SHARE_DIR/assets/badapple"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Creating directories..."
mkdir -p "$INSTALL_DIR" "$THEME_DIR" "$LOGO_DIR" "$BADAPPLE_DIR"

echo "Installing katifetch..."
cp "$SCRIPT_DIR/katifetch.sh" "$INSTALL_DIR/katifetch"
chmod +x "$INSTALL_DIR/katifetch"

echo "Copying themes and logos..."
cp -r "$SCRIPT_DIR/themes/"* "$THEME_DIR"
cp -r "$SCRIPT_DIR/logos/"* "$LOGO_DIR"

if [ -f "$SCRIPT_DIR/assets/kaka.sh" ] && [ -f "$SCRIPT_DIR/assets/badapple_6572frames.ascii.gz" ]; then
  echo "Installing Bad Apple assets..."
  cp "$SCRIPT_DIR/assets/kaka.sh" "$BADAPPLE_DIR/"
  cp "$SCRIPT_DIR/assets/badapple_6572frames.ascii.gz" "$BADAPPLE_DIR/"
  chmod +x "$BADAPPLE_DIR/kaka.sh"
fi

# Config
if [ ! -f "$HOME/.katifetchrc" ]; then
  echo "Installing default configuration..."
  if [ -f "$SCRIPT_DIR/.katifetchrc" ]; then
    cp "$SCRIPT_DIR/.katifetchrc" "$HOME/.katifetchrc"
  else
    cat > "$HOME/.katifetchrc" <<EOF
theme=default
show_logo=yes
show_colors=yes
EOF
  fi
fi

echo "Installation complete! Run 'katifetch' to test it."

# ASCII banner
cat << "EOF"
      ___           ___                                                    ___                         ___           ___     
     /  /\         /  /\          ___            ___         ___          /  /\          ___          /  /\         /  /\    
    /  /:/        /  /::\        /__/\          /__/\       /  /\        /  /::\        /__/\        /  /::\       /  /:/    
   /  /:/        /  /:/\:\       \  \:\         \__\:\     /  /::\      /  /:/\:\       \  \:\      /  /:/\:\     /  /:/     
  /  /::\____   /  /::\ \:\       \__\:\        /  /::\   /  /:/\:\    /  /::\ \:\       \__\:\    /  /:/  \:\   /  /::\ ___ 
 /__/:/\:::::\ /__/:/\:\_\:\      /  /::\    __/  /:/\/  /  /::\ \:\  /__/:/\:\ \:\      /  /::\  /__/:/ \  \:\ /__/:/\:\  /\
 \__\/~|:|~~~~ \__\/  \:\/:/     /  /:/\:\  /__/\/:/~~  /__/:/\:\ \:\ \  \:\ \:\_\/     /  /:/\:\ \  \:\  \__\/ \__\/  \:\/:/
    |  |:|          \__\::/     /  /:/__\/  \  \::/     \__\/  \:\_\/  \  \:\ \:\      /  /:/__\/  \  \:\            \__\::/ 
    |  |:|          /  /:/     /__/:/        \  \:\          \  \:\     \  \:\_\/     /__/:/        \  \:\           /  /:/  
    |__|:|         /__/:/      \__\/          \__\/           \__\/      \  \:\       \__\/          \  \:\         /__/:/   
     \__\|         \__\/                                                  \__\/                       \__\/         \__\/    
     Katifetch for Linux
EOF
