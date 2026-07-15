{ lib, ... }:
let
  inherit (lib) mkOption types;

  # 6 hexadecimals
  hexColor = types.strMatching "[0-9a-fA-F]{6}";

  # create roles for colors 1 is more muted than 2
  roleNames = [
    "background1"
    "background2"
    "surface1"
    "surface2"
    "foreground"
    "muted"
    "accent1"
    "accent2"
    "success1"
    "success2"
    "warning1"
    "warning2"
    "error1"
    "error2"
    "info1"
    "info2"
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

  options.dave.theme = {
    # create global theme option
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

    # create user options for wallpaper and lockscreen
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
