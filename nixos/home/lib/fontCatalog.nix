{ pkgs, ... }:
let
  notoPackage = pkgs.noto-fonts;
in
{
  notoSans = {
    package = notoPackage;
    name = "Noto Sans";
  };

  notoSerif = {
    package = notoPackage;
    name = "Noto Serif";
  };
  notoEmoji = {
    package = pkgs.noto-fonts-color-emoji;
    name = "Noto Color Emoji";
  };
  mapleMono = {
    package = pkgs.maple-mono.NF;
    name = "Maple Mono NF";
  };
  lora = {
    package = pkgs.lora;
    name = "Lora";
  };
  jetBrainsMono = {
    package = pkgs.nerd-fonts.jetbrains-mono;
    name = "JetBrainsMono Nerd Font Mono";
  };
  liberation = {
    package = pkgs.liberation_ttf;
    name = "";
  };
  nf_symbol = {
    package = pkgs.nerd-fonts.symbols-only;
    name = "Symboles Nerd Font";

  };
}
