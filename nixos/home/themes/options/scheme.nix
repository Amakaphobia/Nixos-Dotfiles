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

  colorRoles = {
    color0 = "black";
    color1 = "red";
    color2 = "green";
    color3 = "yellow";
    color4 = "blue";
    color5 = "magenta";
    color6 = "cyan";
    color7 = "light-grey";
    color8 = "dark-grey";
    color9 = "bright-red";
    color10 = "bright-green";
    color11 = "bright-yellow";
    color12 = "bright-blue";
    color13 = "bright-magenta";
    color14 = "bright-cyan";
    color15 = "bright-white";
  };
  terminalOptions = lib.mapAttrs (
    name: colorName:
    mkOption {
      type = hexColor;
      description = "ANSI ${colorName} (${name}).";
    }
  ) colorRoles;
  # get the terminal colors of the chosen scheme
  terminalColors = config.dave.theme.scheme.terminal;
  terminalNames = builtins.attrNames colorRoles;
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
