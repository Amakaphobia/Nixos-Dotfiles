-------------------
--- My Rules ------
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- pavucontrol
hl.window_rule({
  name = "PavuControl Rules",
  match = { class = "org.pulseaudio.pavucontrol" },
  float = true,
})

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
-- Workspace-Rules
-- keep workspaces 1-4 peristent for term shell firefox and obsidian
hl.workspace_rule({ workspace = "1", default_name = "", persistent = true })
hl.workspace_rule({ workspace = "2", default_name = "", persistent = true })
hl.workspace_rule({ workspace = "3", default_name = "", persistent = true })
hl.workspace_rule({ workspace = "4", default_name = "", persistent = true })

-- default rules follow after:
hl.window_rule({
  name = "suppress-maximize-events",
  match = { class = ".*" },

  suppress_event = "maximize",
})

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },

  no_focus = true,
})
