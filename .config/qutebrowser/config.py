from qutebrowser.config.config import ConfigContainer
from qutebrowser.config.configfiles import ConfigAPI

config: ConfigAPI = config  # type: ignore
c: ConfigContainer = c  # type: ignore

config.load_autoconfig(True)
config.source("colors.py")

# Keybindings
config.bind("<space>ds", "open -t https://chat.deepseek.com")
config.bind("<space>gpt", "open -t https://chat.openai.com")

# Settings
c.statusbar.show = "in-mode"
c.tabs.show = "switching"

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "gg": "https://www.google.com/search?q={}",
    "wa": "https://wiki.archlinux.org/?search={}",
    "yt": "https://www.youtube.com/results?search_query={}",
}
