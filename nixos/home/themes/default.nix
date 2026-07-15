{ pkgs, lib, ... }:
let
  inherit (lib) mkOption types;

  hexColor = types.strMatching "[0-9a-fA-F]{6}";

  roleNames = [
    "background"
    "background_alt"
    "surface"
    "surface_alt"
    "foreground"
    "muted"
    "accent"
    "accent_alt"
    "success"
    "warning"
    "error"
    "info"
    "border"
  ];

  roleOptions = lib.genAttrs roleNames (
    name:
    mkOption {
      type = hexColor;
      description = "Semantic theme color: ${name}";
    }
  );
in
{
  config = {
    gtk.enable = true;

    dconf.settings."org/gnome/desktop/interface" = {
      # set dark as default
      color-scheme = "prefer-dark";
    };

    # change the cursor
    home.pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Ice";
      size = 24;

      gtk.enable = true;
    };
  };

  # create user options for wallpaper and lockscreen
  options.dave.theme = {
    scheme = mkOption {
      description = "Global desktop color scheme.";

      type = types.submodule {
        options = {
          name = mkOption {
            type = types.str;
            description = "Human-readable theme name.";
          };

          palette = mkOption {
            type = types.attrsOf hexColor;
            description = "Raw named color palette.";
          };

          roles = mkOption {
            description = "Application-independent semantic colors.";

            type = types.submodule {
              options = roleOptions;
            };
          };

          terminal = mkOption {
            type = types.attrsOf hexColor;
            description = "ANSI terminal colors named color0 through color15.";
          };
        };
      };
    };
    wallpaper = lib.mkOption {
      type = lib.types.path;
      description = "Wallpaper used by hyprpaper";
    };

    lockscreen = lib.mkOption {
      type = lib.types.path;
      description = "Lockscreen used by hyprlock";
    };
  };
}
