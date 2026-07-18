{ pkgs, wallpapersPath, ... }:
let
  # notoSans = {
  #       package = pkgs.noto-fonts;
  #       name = "Noto Sans";
  #     };

  mapleMono = {
    package = pkgs.maple-mono.NF;
    name = "Maple Mono NF";
  };
  lora = {
    package = pkgs.lora;
    name = "Lora";
  };
  # notoSerif = {
  #   package = pkgs.noto-fonts;
  #   name = "Noto Serif";
  # };
  jetBrainsMono = {
    package = pkgs.nerd-fonts.jetbrains-mono;
    name = "JetBrainsMono Nerd Font Mono";
  };
  notoEmoji = {
    package = pkgs.noto-fonts-color-emoji;
    name = "Noto Color Emoji";
  };
in
{

  dave.theme = {
    polarity = "dark";
    scheme = import ../../themes/palettes/catppuccin-mocha.nix;

    images = {
      wallpaper = wallpapersPath + "/waifu/AngelBlue.png";
      lockscreen = wallpapersPath + "/waifu/purplegirl.jpeg";
    };

    fonts = {
      sansSerif = mapleMono;
      serif = lora;
      monospace = jetBrainsMono;
      emoji = notoEmoji;
      sizes = {
        desktop = 10;
        applications = 10;
        terminal = 11;
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
