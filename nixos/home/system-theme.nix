{ pkgs, ... }:

{
  gtk.enable = true;

  #change the cursor
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Ice";
    size = 24;

    gtk.enable = true;
  };
  dconf.settings."org/gnome/desktop/interface" = {
    #set dark as default
    color-scheme = "prefer-dark";
  };
}
