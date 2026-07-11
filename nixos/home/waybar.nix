{ config, ... }:

let
  waybarConfigDirectory = "${config.home.homeDirectory}/nixos-dotfiles/nixos/home/waybar";
in
{
  programs.waybar = {
    enable = true;
    # autostart:
    systemd.enable = true;
  };

  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink waybarConfigDirectory;
}
