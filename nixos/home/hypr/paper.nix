{ config, ... }:

let
  wallpaper = ../../../wallpapers/waifu/AngelBlue.png;
in
{
  services.hyprpaper = {
    enable = true;

    settings = {

      splash = false;

      wallpaper = [
        {
          fit_mode = "cover";
          monitor = "eDP-1";
          path = "${wallpaper}";
        }

      ];
    };
  };
}
