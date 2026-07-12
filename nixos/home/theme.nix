{ pkgs, lib, ... }:

{
  config = {
    gtk.enable = true;

    dconf.settings."org/gnome/desktop/interface" = {
      #set dark as default
      color-scheme = "prefer-dark";
    };

    #change the cursor
    home.pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Ice";
      size = 24;

      gtk.enable = true;
    };
  };

  #create user options for wallpaper and lockscreen
  options.dave.theme = {
    wallpaper = lib.mkOption {
      type = lib.types.path;
      description = "Wallpaper used by hyprpaper";
    };

    lockscreen = lib.mkOption {
      type = lib.types.path;
      description = "Lockscreen used by hyprlock";
    };
  };
}
