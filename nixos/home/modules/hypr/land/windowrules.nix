{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
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

    ];
  };
}
