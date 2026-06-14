hl.config({
    input = {
        kb_layout  = "de",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        force_no_accel = true,
        -- sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
    workspace_swipe_numbered = true,
    workspace_swipe_use_r = true
})

hl.gesture({
    fingers = 4,
    direction = "down",
    mods = "SUPER",
    action = "special",
    workspace_name = "scratchpad",
    disable_inhibit = true
})

hl.gesture({ 
    fingers = 2,
    mods = "SUPER",
    direction = "pinchin", 
    action = "cursorZoom", 
    zoom_level = 2.0, 
    mode = "mult" 
})

hl.gesture({ 
    fingers = 2, 
    mods = "SUPER",
    direction = "pinchout", 
    action = "cursorZoom", 
    zoom_level = 0.5, 
    mode = "mult"
})

hl.gesture({
    fingers =  3,
    direction = "up",
    action = function()
        hl.exec_cmd("notify-send hello")
    end
})
