{ config, lib, ... }:
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
