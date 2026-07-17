{ wallpapersPath, ... }:
{

  dave.theme = {
    polarity = "dark";
    scheme = import ../../themes/palettes/catppuccin-mocha.nix;
    images = {
      wallpaper = wallpapersPath + "/waifu/AngelBlue.png";
      lockscreen = wallpapersPath + "/waifu/purplegirl.jpeg";
    };
  };
}
