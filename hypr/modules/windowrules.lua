local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

local moveHyprlandRunRule = hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "window-deco-webapps",
    match = { class = "brave-.*" },

    decorate = false,
})

-- Doesn't work as wofi isn't managed by hyprland
hl.window_rule({
    name = "wofi-dimming",
    match = { class = "wofi" },

    dim_around = true,
})

moveHyprlandRunRule:set_enabled(true)
