{
  config,
  pkgs,
  lib,
  ...
}:

let
  colorsLib = import ../../lib/colors.nix {
    inherit lib;
  };

  colorDefinitions = colorsLib.toGtkCss config.dave.theme.scheme.roles;

  gtkSourceDirectory = "${config.home.homeDirectory}/nixos-dotfiles-gtk/nixos/home/themes/gtk";
in
{
  gtk = {
    enable = true;
    colorScheme = "dark";

    font = {
      package = pkgs.maple-mono.truetype;
      name = "Maple Mono";
      size = 11;
    };
    gtk3.extraCss = ''
      @import url("colors.css");
      @import url("theme.css");
    '';

    gtk4.extraCss = ''
      @import url("colors.css");
      @import url("theme.css");
    '';
  };

  xdg.configFile = {
    "gtk-3.0/colors.css".text = colorDefinitions;
    "gtk-4.0/colors.css".text = colorDefinitions;

    "gtk-3.0/theme.css".source = config.lib.file.mkOutOfStoreSymlink "${gtkSourceDirectory}/gtk3.css";

    "gtk-4.0/theme.css".source = config.lib.file.mkOutOfStoreSymlink "${gtkSourceDirectory}/gtk4.css";
  };
}
