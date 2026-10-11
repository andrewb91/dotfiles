-- SYSTEM KEYBINDS
hl.bind(
    mainMod .. " + Q",
    hl.dsp.window.close()
)

-- RESTART HYPRLAND
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("hyprctl dispatch exit"))

-- RESIZE SUBMAP

hl.bind(
    mainMod .. " + R",
    function()
        hl.dispatch(hl.dsp.submap("resize"))
    end
)

hl.define_submap("resize", function()

    -- H = left
    hl.bind(
        "H",
        hl.dsp.window.resize({
            x = -50,
            y = 0,
            relative = true,
        }),
        { repeating = true }
    )

    -- L = right
    hl.bind(
        "L",
        hl.dsp.window.resize({
            x = 50,
            y = 0,
            relative = true,
        }),
        { repeating = true }
    )

    -- K = up
    hl.bind(
        "K",
        hl.dsp.window.resize({
            x = 0,
            y = -20,
            relative = true,
        }),
        { repeating = true }
    )

    -- J = down
    hl.bind(
        "J",
        hl.dsp.window.resize({
            x = 0,
            y = 20,
            relative = true,
        }),
        { repeating = true }
    )

    -- Escape = leave resize mode
    hl.bind(
        "escape",
        function()
            hl.dispatch(hl.dsp.submap("reset"))
        end
    )

end)

-- MOVE FOCUSED WINDOW
hl.bind(
    mainMod .. " + SHIFT + H",
    hl.dsp.window.move({ direction = "l" })
)

hl.bind(
    mainMod .. " + SHIFT + J",
    hl.dsp.window.move({ direction = "d" })
)

hl.bind(
    mainMod .. " + SHIFT + K",
    hl.dsp.window.move({ direction = "u" })
)

hl.bind(
    mainMod .. " + SHIFT + L",
    hl.dsp.window.move({ direction = "r" })
)

-- MOVE FOCUS
hl.bind(
    mainMod .. " + H",
    hl.dsp.focus({ direction = "left" })
)

hl.bind(
    mainMod .. " + J",
    hl.dsp.focus({ direction = "d" })
)

hl.bind(
    mainMod .. " + K",
    hl.dsp.focus({ direction = "u" })
)

hl.bind(
    mainMod .. " + L",
    hl.dsp.focus({ direction = "right" })
)

-- OTHER
hl.bind(
    "SUPER + SHIFT + M",
    hl.dsp.exec_cmd(
        "~/.local/bin/hypr_toggle.sh toggle")
  )

hl.bind(
    "SUPER + SHIFT + H",
    hl.dsp.exec_cmd("~/.local/bin/monitor-external")
  )

hl.bind(
    "SUPER + SHIFT + D",
    hl.dsp.exec_cmd("~/.local/bin/monitor-internal")
  )

hl.bind(
    "SUPER + SHIFT + R",
    hl.dsp.exec_cmd(
        "hyprctl reload") 
  )

-- WORKSPACES
for i = 1, 10 do
    local key = i % 10

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end

-- MULTIMEDIA KEYS
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true }
)

-- MEDIA PLAYER
hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)
