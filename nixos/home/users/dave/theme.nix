{ wallpapersPath, ... }:
{
  dave.theme = {
    scheme = import ../../themes/palettes/catppuccin-mocha.nix;
    wallpaper = wallpapersPath + "/waifu/AngelBlue.png";
    lockscreen = wallpapersPath + "/waifu/purplegirl.jpeg";
  };
}
