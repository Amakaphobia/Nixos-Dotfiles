{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  theme = config.dave.theme.scheme;

  colorsLib = import ../../lib/colors.nix {
    inherit lib;
  };

  # @Mauve,Base
  # and:
  # @accent,background
  colorCss = colorsLib.toGtkCss (theme.palette // theme.roles);
  waybarConfig = pkgs.runCommand "waybar-config-${theme.name}" { } ''
    mkdir -p "$out"

    cp -R ${./config}/. "$out/"
    chmod -R u+w "$out"

    printf '%s\n' ${lib.escapeShellArg colorCss} > "$out/style/color.css"
  '';
in
{
  programs.waybar = {
    enable = true;
    # autostart:
    systemd.enable = true;
    package = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };

  xdg.configFile."waybar".source = waybarConfig;
}
