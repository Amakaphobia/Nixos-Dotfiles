{ lib, pkgs, ... }:

let
  grim = lib.escapeRegex (lib.getExe pkgs.grim);

  portal = lib.escapeRegex (
    "${pkgs.xdg-desktop-portal-hyprland}" + "/libexec/.xdg-desktop-portal-hyprland-wrapped"
  );
in
{
  wayland.windowManager.hyprland.settings = {
    config.ecosystem.enforce_permissions = true;

    permission = [
      # Specific rules first
      {
        _args = [
          grim
          "screencopy"
          "allow"
        ];
      }

      {
        _args = [
          portal
          "screencopy"
          "allow"
        ];
      }

      # Fallback rule last
      {
        _args = [
          ".*"
          "screencopy"
          "deny"
        ];
      }
      {
        _args = [
          ".*"
          "plugin"
          "deny"
        ];
      }
    ];
  };
}
