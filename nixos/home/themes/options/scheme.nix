{ config, lib, ... }:
let
  inherit (lib) mkOption types;
  # 6 hexadecimals
  hexColor = types.strMatching "[0-9a-fA-F]{6}";

  # List all semantic colors and their descriptions

  roleDescriptions = {

    # Neutral surfaces
    background = "default background for applications";
    surface = "default background for containers";
    surfaceRaised = "visually elevated containers";
    overlay = "Background for floating content such as menus, popovers and tooltips.";

    # Foreground content
    foregroundDisabled = "very muted forground tone";
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

  roleOptions = lib.mapAttrs (
    _: description:
    mkOption {
      inherit description;
      type = hexColor;
    }
  ) roleDescriptions;

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

  # check for missing desktop colors the same way
  roleNames = builtins.attrNames roleDescriptions;
  roleColors = config.dave.theme.scheme.roles;
  missingRoleColors = lib.filter (name: !(builtins.hasAttr name roleColors)) roleNames;
in
{

  # make sure the scheme is complete
  config = {
    assertions = [
      {
        assertion = missingRoleColors == [ ];
        message = ''
          Theme "${config.dave.theme.scheme.name}" is missing desktop colors:
          ${lib.concatStringsSep ", " missingRoleColors}
        '';
      }
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
