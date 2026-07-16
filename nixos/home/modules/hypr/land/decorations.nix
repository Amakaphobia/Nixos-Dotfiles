{ config, lib, ...}:
let
  colorsLib = import ../../../lib/colors.nix {
    inherit lib;
  };
  colors = config.dave.theme.scheme.roles;

  border1 = ( colorsLib.hyprRgba colors.accent1 "ff" );
  border2 = ( colorsLib.hyprRgba colors.info1 "ff" );
  borderInactive = ( colorsLib.hyprRgba colors.background2 "dd" );
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      # Gaps
      gaps_in = 3;
      gaps_out = 8;

      # border
        border_size = 2;
      col = {
        active_border = {
          colors = [
            border2
            border1
          ];
          angle = 90;
        };
        inactive_border = borderInactive;
      };
    resize_on_border = false;
    allow_tearing = false;
    };
  };
}
