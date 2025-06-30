from qutebrowser.config.config import ConfigContainer
from qutebrowser.config.configfiles import ConfigAPI

config: ConfigAPI = config  # type: ignore
c: ConfigContainer = c  # type: ignore

config.load_autoconfig(True)
config.source("colors.py")

c.statusbar.show = "in-mode"
