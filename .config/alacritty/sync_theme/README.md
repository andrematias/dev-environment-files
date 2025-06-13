# Alacritty theme sync MacOS

## Update alacritty.toml

```toml
[general]
import = [ "~/.config/alacritty/themes/theme-dark.toml" ]
```

## Create light and dark themes

1. Create theme-dark.toml file

```bash
mkdir -p $HOME/.config/alacritty/themes
touch $HOME/.config/alacritty/themes/theme-dark.toml
```

2. Add theme colors

```toml
# Default colors
[colors.primary]
background = '#24292e'
foreground = '#d1d5da'

# Normal colors
[colors.normal]
black   = '#586069'
red     = '#ea4a5a'
green   = '#34d058'
yellow  = '#ffea7f'
blue    = '#2188ff'
magenta = '#b392f0'
cyan    = '#39c5cf'
white   = '#d1d5da'

# Bright colors
[colors.bright]
black   = '#959da5'
red     = '#f97583'
green   = '#85e89d'
yellow  = '#ffea7f'
blue    = '#79b8ff'
magenta = '#b392f0'
cyan    = '#56d4dd'
white   = '#fafbfc'

[[colors.indexed_colors]]
index = 16
color = '#d18616'

[[colors.indexed_colors]]
index = 17
color = '#f97583'
```

3. Create theme-light.toml file

```bash
mkdir -p $HOME/.config/alacritty/themes
touch $HOME/.config/alacritty/themes/theme-light.toml
```

4. Add light colors theme

```toml
# Default colors
[colors.primary]
background = '#ffffff'
foreground = '#24292f'

# Normal colors
[colors.normal]
black   = '#24292e'
red     = '#d73a49'
green   = '#28a745'
yellow  = '#dbab09'
blue    = '#0366d6'
magenta = '#5a32a3'
cyan    = '#0598bc'
white   = '#6a737d'

# Bright colors
[colors.bright]
black   = '#959da5'
red     = '#cb2431'
green   = '#22863a'
yellow  = '#b08800'
blue    = '#005cc5'
magenta = '#5a32a3'
cyan    = '#3192aa'
white   = '#d1d5da'

[[colors.indexed_colors]]
index = 16
color = '#d18616'

[[colors.indexed_colors]]
index = 17
color = '#cb2431'

```

## Sync theme script

1. Create the script file

```bash
touch $HOME/.config/alacritty/alacritty-sync-theme
```

2. Add script content

```bash
#!/bin/bash

CONFIG="$HOME/.config/alacritty/alacritty.toml"
DARK="theme-dark.toml"
LIGHT="theme-light.toml"

get_theme() {
  if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
    echo "dark"
  else
    echo "light"
  fi
}

apply_theme() {
  if [[ "$1" == "dark" ]]; then
    sed -i '' "s/$LIGHT/$DARK/" "$CONFIG"
  else
    sed -i '' "s/$DARK/$LIGHT/" "$CONFIG"
  fi
}

last_mode=""
while true; do
  current_mode=$(get_theme)
  if [[ "$current_mode" != "$last_mode" ]]; then
    apply_theme "$current_mode"
    last_mode="$current_mode"
  fi
  sleep 1
done
```

3. Give execution permissions

```bash
sudo chmod +x $HOME/.config/alacritty/alacritty-sync-theme
```

4. Create symlinks to a PATH directory

```bash
sudo ln -sf $HOME/.config/alacritty/alacritty-sync-theme /usr/local/bin/alacritty-sync-theme
```

## Background service

### Create a plist

1. Create the plist file

```bash
touch $HOME/Library/LaunchAgents/com.matias.alacritty-sync-theme.plist
```

2. Add content into plist file

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>com.matias.alacritty-theme-sync</string>

    <key>ProgramArguments</key>
    <array>
      <string>/bin/bash</string>
      <string>/usr/local/bin/alacritty-sync-theme</string>
    </array>

    <key>RunAtLoad</key>
    <true/>

    <key>KeepAlive</key>
    <true/>
  </dict>
</plist>
```

3. Give permissions

```bash
chmod 644 $HOME/Library/LaunchAgents/com.matias.alacritty-sync-theme.plist
```

4. Load background service

```bash
launchctl unload $HOME/Library/LaunchAgents/com.matias.alacritty-sync-theme.plist 2>/dev/null || true
launchctl load $HOME/Library/LaunchAgents/com.matias.alacritty-sync-theme.plist
```
