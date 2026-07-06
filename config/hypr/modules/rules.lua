-------------------
--- My Rules ------
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Obsidian
hl.window_rule({
    name = "Obsidian Rules",
    match = { class = "obsidian" },

    workspace = "4",
    opaque = true,
})				

-- Firefox
hl.window_rule({
    name = "Firefox Rules",
    match = { class = "firefox" },

    workspace = "3 silent",
    opaque = true,
})
-- open Firefox if not open, and workspace 3 is selected:
hl.workspace_rule({workspace = "3", on_created_empty = "firefox"})


-- default rules follow after:
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

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
