---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "de",
		-- this disables needing to press ticks and backticks twice for on character
		kb_variant = "nodeadkeys",
		kb_model = "",
		kb_options = "caps:swapescape",
		kb_rules = "",

		-- 0 -> click to focus
		-- 1 -> window under cursor is focused
		-- 2 -> keyboard and mouse focus are seperate, clicking changes keyboard focus
		-- 3 -> keyboard and mouse focus are seperate
		follow_mouse = 2,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			tap_to_click = false,
			natural_scroll = false,
			disable_while_typing = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
