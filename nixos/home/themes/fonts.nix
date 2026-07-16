{ pkgs, ... }:
{
  # Fonts
  fonts.fontconfig = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      liberation_ttf
    ];

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
