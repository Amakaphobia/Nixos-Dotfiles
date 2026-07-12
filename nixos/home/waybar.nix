{ config, flakePath, ... }:

let
  waybarConfigDirectory = "${flakePath}/home/waybar";
in
{
  programs.waybar = {
    enable = true;
    # autostart:
    systemd.enable = true;
  };

  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink waybarConfigDirectory;
}
