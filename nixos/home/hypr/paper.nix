{ config, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {

      splash = false;
    
      wallpaper = [
        {
          fit_mode = "cover";
          monitor = "eDP-1";
          path = "${config.home.homeDirectory}/nixos-dotfiles/wallpapers/currentWall";
        }

      ];
    };
  };
}
