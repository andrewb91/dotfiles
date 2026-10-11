-- ENVIRONMENT
hl.env("XCURSOR_SIZE", "20")
hl.env("HYPRCURSOR_SIZE", "20")

-- LOOK AND FEEL
hl.config({

-- GENERAL
    general = {
        gaps_in = 6,
        gaps_out = 10,
        border_size = 0,

        col = {
            active_border = {
                colors = {
                    "rgba(33ccffee)",
                    "rgba(00ff99ee)",
                },
                angle = 45,
            },

            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",
    },

-- DECORATION
    decoration = {
        rounding = 10,
        rounding_power = 2,

        active_opacity = 0.8,
        inactive_opacity = 0.7,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 10,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

-- MISC
    misc = {
        disable_autoreload = true,
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },

})

-- DWINDLE
hl.config({
    dwindle = {
        preserve_split = false,
        force_split = 2,
    },
})

-- MASTER
hl.config({
    master = {
        new_status = "master",
    },
})


-- For Noctalia Color templates
-- require("noctalia").apply_theme()
