{ ... }:
let
  lua = lib.generators.mkLuaInline;

  firstEmptyWorkspace = lua "
	local function firstEmptyWorkspaceFrom(startId, ignoredWindow)
	  local occupied = {}

	  for _, workspace in ipairs(hl.get_workspaces()) do
	    if workspace.id >= startId and not workspace.special then
	      local windowCount = workspace.windows

	      -- window.open fires after the new window has been assigned to a
	      -- workspace. Do not count Spotify itself when deciding whether that
	      -- workspace was previously empty.
	      if ignoredWindow.workspace == workspace then
		windowCount = windowCount - 1
	      end

	      occupied[workspace.id] = windowCount > 0
	    end
	  end

	  local workspaceId = startId

	  while occupied[workspaceId] do
	    workspaceId = workspaceId + 1
	  end

	  return workspaceId
	end";
  spotifyOnWindowOpen = lua "
	hl.on("window.open", function(window)
	  local class = window.initial_class

	  if class == nil or class == "" then
	    class = window.class
	  end

	  if string.lower(class or "") ~= "spotify" then
	    return
	  end

	  local targetWorkspace = firstEmptyWorkspaceFrom(5, window)

	  hl.dispatch(hl.dsp.window.move({
	    workspace = tostring(targetWorkspace),
	    follow = true,
	    window = window,
	  }))
	end)";
in
{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
    	{
	  name = "float-modal-windows";
	  match = {
            modal = true;
	  }
	  float = true;
	  center = true;
	}
      	{
        name = "PavuControl Rules";
        match.class = "org.pulseaudio.pavucontrol";

        float = true;
      }
      {
        name = "Network-connection Editor Rules";
        match.class = "nm-connection-editor";

        float = true;
      }
      {
        name = "Obsidian Rules";
        match.class = "obsidian";

        workspace = "4";
      }
      {
        name = "Firefox Rules";
        match.class = "firefox";

        workspace = "3 silent";
      }

      # Default rules
      {
        name = "suppress-maximize-events";
        match.class = ".*";

        suppress_event = "maximize";
      }
      {
        # Fix some dragging issues with XWayland
        name = "fix-xwayland-drags";

        match = {
          class = "^$";
          title = "^$";
          xwayland = true;
          float = true;
          fullscreen = false;
          pin = false;
        };

        no_focus = true;
      }
    ];

    workspace_rule = [
      {
        workspace = "1";
        default_name = "";
        persistent = true;
      }
      {
        workspace = "2";
        default_name = "";
        persistent = true;
      }
      {
        workspace = "3";
        default_name = "";
        persistent = true;
      }
      {
        workspace = "4";
        default_name = "";
        persistent = true;
      }
      {
        workspace = "special:scratchpad";

        gaps_in = 8;
        gaps_out = 80;

        no_border = false;
        no_shadow = false;
        no_rounding = false;
        decorate = true;

        animation = "slidevert";
      }
    ];
  };
}
