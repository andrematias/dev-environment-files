#!/bin/zsh

set -e

LINK="/usr/local/bin/alacritty-theme-sync"
PLIST="$HOME/Library/LaunchAgents/com.matias.alacritty-theme-sync.plist"

# Unload do serviço
launchctl unload "$PLIST" 2>/dev/null || true

# Remove plist
if [[ -f "$PLIST" ]]; then
  rm "$PLIST"
  echo "Removido: $PLIST"
fi

# Remove symlink
if [[ -L "$LINK" ]]; then
  sudo rm "$LINK"
  echo "Removido link simbólico: $LINK"
fi

echo "Serviço com.matias.alacritty-theme-sync desinstalado."
