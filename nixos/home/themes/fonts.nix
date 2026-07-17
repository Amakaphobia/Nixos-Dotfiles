{ pkgs, ... }:
{
  # Install fonts into home manager profile
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    liberation_ttf
  ];

  # default fonts
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = [
        "Symbols Nerd Font"
      ];

      serif = [
        "Symbols Nerd Font"
      ];

      monospace = [
        "Symbols Nerd Font Mono"
      ];

    };
  };
}
