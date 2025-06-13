#!/bin/zsh

set -e

SCRIPT="$HOME/.config/alacritty/sync_theme/alacritty-sync-theme"
LINK="/usr/local/bin/alacritty-sync-theme"
PLIST="$HOME/Library/LaunchAgents/com.matias.alacritty-theme-sync.plist"

# Verifica se o script existe
if [[ ! -f "$SCRIPT" ]]; then
  echo "Erro: $SCRIPT não encontrado"
  exit 1
fi

# Cria o symlink
sudo ln -sf "$SCRIPT" "$LINK"
echo "Link simbólico criado: $LINK -> $SCRIPT"

# Cria o arquivo .plist
cat > "$PLIST" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>com.matias.alacritty-theme-sync</string>

    <key>ProgramArguments</key>
    <array>
      <string>/bin/zsh</string>
      <string>$LINK</string>
    </array>

    <key>RunAtLoad</key>
    <true/>

    <key>KeepAlive</key>
    <true/>
  </dict>
</plist>
EOF

chmod 644 "$PLIST"
launchctl unload "$PLIST" 2>/dev/null || true
launchctl load "$PLIST"

echo "Serviço com.matias.alacritty-theme-sync instalado e carregado."
