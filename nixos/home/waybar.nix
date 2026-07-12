{
  pkgs,
  config,
  inputs,
  flakePath,
  ...
}:

let
  waybarConfigDirectory = "${flakePath}/home/waybar";
in
{
  programs.waybar = {
    enable = true;
    # autostart:
    systemd.enable = true;
    package = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };

  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink waybarConfigDirectory;
}
