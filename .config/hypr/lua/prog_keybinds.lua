------------------------------------------------------------
-- MY BINDS
------------------------------------------------------------

hl.bind(
    mainMod .. " + Return",
    hl.dsp.exec_cmd(terminal)
)

hl.bind("SUPER + CTRL + T", hl.dsp.submap("terminal"))
hl.define_submap("terminal", "reset", function()
    hl.bind("B", hl.dsp.exec_cmd("ghostty -e btop"))
    hl.bind("T", hl.dsp.exec_cmd("ghostty -e tmux"))
    hl.bind("V", hl.dsp.exec_cmd("ghostty -e nvim"))
    
end)

hl.bind(
    "SUPER + CTRL + A",
    hl.dsp.exec_cmd("~/.local/bin/AirplaneMode.sh")
)

hl.bind(
    "SUPER + CTRL + B",
    hl.dsp.exec_cmd(browser)
)

hl.bind(
    "SUPER + CTRL + E",
    hl.dsp.exec_cmd("~/.local/bin/rofi-beats")
)

hl.bind("SUPER +CTRL + F", hl.dsp.submap("files"))
hl.define_submap("files", "reset", function()
    hl.bind("A", hl.dsp.exec_cmd("xdg-open /Files/AI/"))
    hl.bind("B", hl.dsp.exec_cmd("xdg-open /run/media/drew/36f83a0d-7333-4cde-ae64-b339e202cbd1"))
    hl.bind("C", hl.dsp.exec_cmd("xdg-open /Files/Computers/"))
    hl.bind("D", hl.dsp.exec_cmd("xdg-open /Files/Documents/"))
    hl.bind("G", hl.dsp.exec_cmd("xdg-open /Files/Games/"))
    hl.bind("H", hl.dsp.exec_cmd("xdg-open /home/drew/"))
    hl.bind("P", hl.dsp.exec_cmd("xdg-open /Files/Pictures/"))
    
end)

hl.bind("SUPER + CTRL + G", hl.dsp.submap("games"))
hl.define_submap("games", "reset", function()
    hl.bind("D", hl.dsp.exec_cmd("lutris lutris:rungameid/1"))
    hl.bind("L", hl.dsp.exec_cmd("lutris"))
    hl.bind("S", hl.dsp.exec_cmd("steam"))
    
end)

hl.bind(
    "SUPER + CTRL + H",
    hl.dsp.exec_cmd("~/.local/bin/monitor-external")
)

hl.bind(
    "SUPER + CTRL + L",
    hl.dsp.exec_cmd("~/.local/bin/monitor-internal")
)

hl.bind("SUPER + CTRL + M", hl.dsp.submap("ollama"))
hl.define_submap("ollama", "reset", function()
    -- Service management
    hl.bind("S", hl.dsp.exec_cmd("systemctl --user start ollama"))
    hl.bind("X", hl.dsp.exec_cmd("systemctl --user stop ollama"))
    hl.bind("R", hl.dsp.exec_cmd("systemctl --user restart ollama"))
    -- Model management
    hl.bind("4", hl.dsp.exec_cmd("ghostty -e ollama run qwen3:4b"))
    hl.bind("8", hl.dsp.exec_cmd("ghostty -e ollama run qwen3:8b"))
    hl.bind("9", hl.dsp.exec_cmd("ghostty -e ollama run qwen3.5:9b"))
    
end)

hl.bind(
    "SUPER + CTRL + N",
    hl.dsp.exec_cmd(
        "qs -c noctalia --daemon ipc call settings toggle")
)

hl.bind(
    "SUPER + SHIFT + N",
    hl.dsp.exec_cmd(
        "~/.local/bin/rofi-wifi-menu.sh")
)

hl.bind(
    "SUPER + SHIFT + R",
    hl.dsp.exec_cmd(
        "~/.local/bin/hypr-reload.sh")
)

hl.bind(
    "SUPER + CTRL + Q",
    hl.dsp.exec_cmd("qs -c noctalia --daemon")
)

hl.bind(
    "SUPER + SHIFT + V",
    hl.dsp.exec_cmd(
        "~/.local/bin/rofi-vpn.sh")
)

hl.bind(
    "SUPER + CTRL + W",
    hl.dsp.exec_cmd(
        "~/.local/bin/workspaces.sh")
)

hl.bind(
    "SUPER + CTRL + X",
    hl.dsp.exec_cmd("hyprlock")
)

hl.bind(
    "SUPER + PRINT",
    hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy')
)

hl.bind(
    "PRINT",
    hl.dsp.exec_cmd("grim ~/screenshot-$(date +%Y%m%d-%H%M%S).png")
)
------------------------------------------------------------
-- AUDIO
------------------------------------------------------------

hl.bind(
    "F2",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%+")
)

hl.bind(
    "F3",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-")
)

hl.bind(
    "F4",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
)


------------------------------------------------------------
-- NOCTALIA
------------------------------------------------------------

hl.bind("SUPER + D", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))

hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))

