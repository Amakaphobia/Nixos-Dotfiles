{ pkgs, ... }:
{
  # Install fonts into home manager profile
  home.packages = with pkgs; [
    nerd-fonts.symbols-only
    liberation_ttf
    maple-mono.NF
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
    };
  };
}
