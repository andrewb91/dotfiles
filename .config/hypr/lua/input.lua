-- INPUT
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "caps:escape",
        kb_rules = "",

        repeat_rate = 50,
        repeat_delay = 300,

        numlock_by_default = true,

        sensitivity = 0,
        left_handed = false,
        follow_mouse = 1,
        float_switch_override_focus = false,

        touchpad = {
            disable_while_typing = true,
            natural_scroll = false,
            clickfinger_behavior = false,
            middle_button_emulation = false,
            tap_to_click = true,
            drag_lock = false,
        },

        touchdevice = {
            enabled = true,
        },

        tablet = {
            transform = 0,
            left_handed = false,
        },
    },
})

-- LID SWITCH
hl.bind(
    "switch:on:Lid Switch",
    function()
        hl.monitor({
            output = "eDP-1",
            disabled = true,
        })
    end,
    { locked = true }
)

hl.bind(
    "switch:off:Lid Switch",
    function()
        hl.monitor({
            output = "eDP-1",
            mode = "1920x1200@60.0",
            position = "1920x0",
            scale = 1.0,
            bitdepth = 10,
        })
    end,
    { locked = true }
)

-- DEVICE-SPECIFIC MOUSE
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
