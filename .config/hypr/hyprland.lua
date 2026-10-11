-- Hyprland 0.56.x

mainMod    = "SUPER"
terminal   = "ghostty"
browser    = "brave-origin-nightly"
fileManager = "pcmanfm"
editor = "nvim"
processmonitor = "btop"

require("lua.autostart")
require("lua.monitors")
require("lua.environment")
require("lua.animations")
require("lua.input")
require("lua.sys_keybinds")
require("lua.prog_keybinds")
-- require("lua.windowrules")

-- For Noctalia Color templates
require("noctalia").apply_theme()
