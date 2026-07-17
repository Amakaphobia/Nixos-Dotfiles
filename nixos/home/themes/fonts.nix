{ pkgs, ... }:
{
  # Install fonts into home manager profile
  home.packages = with pkgs; [
    nerd-fonts.symbols-only
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
    };
  };
}
