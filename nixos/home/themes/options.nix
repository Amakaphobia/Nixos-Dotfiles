{ config, lib, ... }:
let
  inherit (lib) mkOption types;

  # 6 hexadecimals
  hexColor = types.strMatching "[0-9a-fA-F]{6}";

  # create roles for colors 1 is more muted than 2
  roleNames = [

    # Neutral surfaces
    "background"
    "surfaceDark"
    "surfaceLight"
    "overlay"

    # Foreground content
    "foregroundDisabled"
    "foregroundMuted"
    "foreground"

    # Structure and focus
    "border"
    "focus"

    # Interactive colors
    "accent"
    "accentAlt"
    "accentForeground"
    "selection"
    "selectionForeground"

    # Semantic status colors
    "success"
    "warning"
    "error"
    "info"
  ];

  roleOptions = lib.genAttrs roleNames (
    name:
    mkOption {
      type = hexColor;
      description = "Semantic theme color: ${name}";
    }
  );

  # generate terminal color names color0 through color15
  terminalNames = map (number: "color${toString number}") (lib.range 0 15);

  # make hexcolor options out of the terminal color names
  terminalOptions = lib.genAttrs terminalNames (
    name:
    mkOption {
      type = hexColor;
      description = "ANSI terminal color ${name}.";
    }
  );

  # get the terminal colors of the choses scheme
  terminalColors = config.dave.theme.scheme.terminal;

  # check if every name has a color and collect names without colors
  missingTerminalColors = lib.filter (name: !(builtins.hasAttr name terminalColors)) terminalNames;

  fontOptions = lib.genAttrs [ "serif" "sansSerif" "monospace" "emoji" ] (
    name:
    mkOption {
      type = types.submodule {
        options = {
          package = mkOption {
            type = types.package;
          };
          name = mkOption {
            type = types.str;
          };
          descriptions = "Default font for: ${name}";
        };
      };
    }
  );

  sizeOptions = lib.genAttrs [ "desktop" "applications" "terminal" "popups" ] (
    name:
    mkOption {
      type = types.number;
      description = "default size for ${name}";
    }
  );
in
{
  # make sure the theme is complete by asserting the collection of missing colors is empty
  config = {
    assertions = [
      {
        assertion = missingTerminalColors == [ ];
        message = ''
          Theme "${config.dave.theme.scheme.name}" is missing terminal colors:
          ${lib.concatStringsSep ", " missingTerminalColors}
        '';
      }
    ];
  };

  options.dave.theme = {
    # light or dark
    polarity = mkOption {
      type = types.enum [
        "light"
        "dark"
      ];
      description = "is the selected theme light or dark";
    };

    # create font options
    fonts = mkOption {
      descriptions = "Desktop Fonts";
      type = types.submodule {
        options = fontOptions;
      };
      sizes = mkOption {
        type = types.submodule {
          options = sizeOptions;
        };
      };
    };

    # cursor
    cursor = mkOption {
      description = "Desktop cursor theme.";

      type = types.submodule {
        options = {
          package = mkOption {
            type = types.package;
          };
          name = mkOption {
            type = types.str;
          };
          size = mkOption {
            type = types.int;
          };
        };
      };
    };

    icons = mkOption {
      description = "Desktop icon theme.";

      type = types.submodule {
        options = {
          enable = mkOption {
            type = types.bool;
            default = false;
          };
          package = mkOption {
            type = types.nullOr types.package;
            default = null;
          };
        };
      };
    };

    # create global color scheme
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
            type = types.submodule {
              options = terminalOptions;
            };
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
