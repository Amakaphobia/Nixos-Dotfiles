{ pkgs, ... }:
{
  # Install fonts into home manager profile
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    pkgs.maple-mono.NF
    liberation_ttf
  ];

  # default fonts
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = [
        "Noto Sans"
        "Symbols Nerd Font"
      ];

      serif = [
        "Noto Serif"
        "Symbols Nerd Font"
      ];

      monospace = [
        "JetBrainsMono Nerd Font Mono"
        "Symbols Nerd Font Mono"
      ];

      emoji = [
        "Noto Color Emoji"
      ];
    };
  };
}
