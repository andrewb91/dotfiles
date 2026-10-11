------------------------------------------------------------
-- AUTOSTART
------------------------------------------------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("~/.config/hypr/scripts/redlight.sh")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("swaync")
    hl.exec_cmd("~/.config/hypr/scripts/workspaces.sh")
    hl.exec_cmd("noctalia --daemon")
    hl.exec_cmd("~/.local/bin/default_audio.sh")
    hl.exec_cmd("hyprsunset")

end)
