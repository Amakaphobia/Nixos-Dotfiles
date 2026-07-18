{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkOption types;
  # 6 hexadecimals
  hexColor = types.strMatching "[0-9a-fA-F]{6}";

  # List all semantic colors and their descriptions

  semanticRoleDescriptions = {

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

  colorBySemanticRole = lib.mapAttrs (
    name: description:
    mkOption {
      type = types.submodule {
        inherit description;
        hex = mkOption {
          description = "Hex representation of color";
          type = hexColor;
        };
      };
    }
  ) semanticRoleDescriptions;

  terminalColorRoles = {
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
  terminalColorOptions = lib.mapAttrs (
    name: colorName:
    mkOption {
      type = hexColor;
      description = "ANSI ${colorName} (${name}).";
    }
  ) terminalColorRoles;

  myText = pkgs.writeTextFile "colorinfo.txt" lib.strings.join "/n" lib.mapAttrs (
    name: colorHex: "${name} set to ${colorHex}"
  ) config.dave.theme.scheme;

in
{
  # create global color scheme
  options.dave.theme.scheme = mkOption {
    description = "global desktop color scheme.";

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
            options = colorBySemanticRole;
          };
        };

        terminal = mkOption {
          type = types.submodule {
            options = terminalColorOptions;
          };
          description = "ANSI terminal colors named color0 through color15.";
        };
      };
    };
  };

  myText = config.lib.file.mkOutOfStoreSymlink "/home/dave/";
}
