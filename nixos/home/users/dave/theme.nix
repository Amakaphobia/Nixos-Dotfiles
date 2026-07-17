{ pkgs, wallpapersPath, ... }:
{

  dave.theme = {
    polarity = "dark";
    scheme = import ../../themes/palettes/catppuccin-mocha.nix;

    images = {
      wallpaper = wallpapersPath + "/waifu/AngelBlue.png";
      lockscreen = wallpapersPath + "/waifu/purplegirl.jpeg";
    };

    fonts = {
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        desktop = 10;
        applications = 12;
        terminal = 12;
        popups = 10;

      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Ice";
      size = 24;
    };

    icons = {
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
  };
}
