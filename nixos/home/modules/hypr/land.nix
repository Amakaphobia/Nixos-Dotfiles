{ ... }:

{
  imports = [
    ./land
  ];

  wayland.windowManager.hyprland = {
    enable = true; # Enable home manager module for hyprland

    # hyprland is already owned by config.nix at system level:
    package = null;
    portalPackage = null;

    # remove ambiguity
    configType = "lua";
  };
}
