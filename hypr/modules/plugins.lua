hl.config { plugin = { dynamic_cursors = {

    -- enables the plugin
    enabled = true,

    -- disables stretch, tilt or rotate
    mode = "none",

    -- use hyprcursor to get a higher resolution texture when the cursor is magnified
    -- see the `hyprcursor` section below
    hyprcursor = {

        -- use nearest-neighbour (pixelated) scaling when magnifying beyond texture size
        -- this will also have effect without hyprcursor support being enabled
        -- 0 - never use pixelated scaling
        -- 1 - use pixelated when no highres image
        -- 2 - always use pixelated scaling
        nearest = 1,

        -- enable dedicated hyprcursor support
        enabled = true,

        -- resolution in pixels to load the magnified shapes at
        -- be warned that loading a very high-resolution image will take a long time and might impact memory consumption
        -- -1 means we use [normal cursor size] * [shake:base option]
        resolution = -1,

        -- shape to use when clientside cursors are being magnified         -- see the shape-name property of shape rules for possible names
        -- specifying clientside will use the actual shape, but will be pixelated
        fallback = "clientside",
    },
}}}

--- hl.config { plugin = { hyprexpo = {
---     columns = 2,
---     gaps_in = 5,
---     skip_empty = true,
---     cancel_key = esc,
---     label_enable = false,
--- }}}
