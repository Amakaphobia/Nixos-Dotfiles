{ pkgs, ... }:
{
  hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  security = {
    # Set the rights for hyprlands hyprlock
    security.pam.services.hyprlock = { };
    # polkit is used for auth
    security.polkit.enable = true;
  };
  #Hyprland Portals
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
}
