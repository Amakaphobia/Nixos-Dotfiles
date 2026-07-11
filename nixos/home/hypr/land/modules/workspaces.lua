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
-- Workspace-Rules
-- keep workspaces 1-4 peristent for term shell firefox and obsidian
hl.workspace_rule({ workspace = "1", persistent = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })
hl.workspace_rule({ workspace = "4", persistent = true })

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
