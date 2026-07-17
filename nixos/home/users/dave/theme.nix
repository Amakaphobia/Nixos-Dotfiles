{ pkgs, wallpapersPath, ... }:
{

  dave.theme = {
    polarity = "dark";
    scheme = import ../../themes/palettes/catppuccin-mocha.nix;

    images = {
      wallpaper = wallpapersPath + "/waifu/AngelBlue.png";
      lockscreen = wallpapersPath + "/waifu/purplegirl.jpeg";
    };

    typography = {
      fonts = with pkgs; {
        sansSerif = maple-mono.NF;
        serif = noto-fonts;
        monospace = nerd-fonts.jetbrains-mono;
        emoji = noto-fonts-color-emoji;
      };
    };
  };
}
