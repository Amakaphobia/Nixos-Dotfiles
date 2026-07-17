{ config, lib, ... }:
let
  inherit (lib) mkOption types;
  # 6 hexadecimals
  hexColor = types.strMatching "[0-9a-fA-F]{6}";

  # List all semantic colors and their descriptions

  roleDescriptions = {

    # Neutral surfaces
    background = "default background for applications";
    surfaceDark = "default background for containers";
    surfaceLight = "visually elevated containers";
    overlay = "highlights and selection background";

    # Foreground content
    foregroundDisabled = "very muted foreground tone";
    foregroundMuted = "muted forground tone";
    foreground = "default tone for text";

    # Structure and focus
    border = "default border tone";
    focus = "default border tone for focused objects";

    # Interactive colors
    accent = "default accent color";
    accentAlt = "alternative accent color";
    accentForeground = "foreground accent color";
    selection = "default selection color";
    selectionForeground = "default selection foreground";

    # Semantic status colors
    success = "indicates success";
    warning = "indicates a non critical problem";
    error = "indicates a critical problem";
    info = "indicates noteworthy information";
  };

  roleOptions = lib.mapAttrs roleDescriptions (
    _: description:
    mkOption {
      inherit description;
      type = hexColor;
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

  # make sure the scheme is atleast terminal-complete
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
  # create global color scheme
  options.dave.theme.scheme = mkOption {
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
}
