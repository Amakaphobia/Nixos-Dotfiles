local mainMod = "SUPER"

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local fileManager = "thunar"
local menu = "pgrep fuzzel >/dev/null 2>&1 && pkill fuzzel || fuzzel"
local lock = "pidof hyprlock > /dev/null || hyprlock"
--local waybar = "pgrep waybar >/dev/null 2>&1 && pkill waybar || waybar"
local waybar = "pkill -USR1 waybar"
-- swap to ws3 open firefox if not open
local browser = "sh -c 'pgrep -f \"^/run/current-system/sw/bin/firefox( |$)\" >/dev/null 2>&1 || exec firefox'"
-- screenshot a region
local screenshotRegion = [[sh -c '
  mkdir -p "$HOME/Pictures/Screenshots"

  region="$(slurp)" || exit 0

  grim -g "$region" -t ppm - |
    satty \
      --filename - \
      --copy-command wl-copy \
      --output-filename "$HOME/Pictures/Screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png"
']]

-- complete screenshot
local screenshotFull = [[sh -c '
  grim -t ppm - |
    satty \
      --filename - \
      --copy-command wl-copy \
      --output-filename "$HOME/Pictures/Screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png"
']]

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(screenshotRegion))
---------------------
---- My Keybinds ----
---------------------


hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd(lock))

--toggle waybar
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(waybar))

-- close window
hl.bind(mainMod .. " + W", hl.dsp.window.close())

-- kill hyprland
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("hyprshutdown"))

-- fullscreen and float toggle
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  if i == 3 then
    hl.bind(mainMod .. " + " .. key, hl.dsp.exec_cmd(browser))
  end
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- previous
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))

-- next
hl.bind(mainMod .. " + RETURN", hl.dsp.focus({ workspace = "e+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Toggle between Dwindle and scrolling
hl.bind(mainMod .. " + SHIFT + SPACE", function()
  local currentLayout = hl.get_config("general.layout")
  local nextLayout

  if currentLayout == "dwindle" then
    nextLayout = "scrolling"
  else
    nextLayout = "dwindle"
  end

  hl.config({
    general = {
      layout = nextLayout,
    },
  })
end)

-- screenshot tools
-- region
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(screenshotRegion))
-- full
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd(screenshotFull))

-- Laptop multimedia keys for volume and LCD brightness
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
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
