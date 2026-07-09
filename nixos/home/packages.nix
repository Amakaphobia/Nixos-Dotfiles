{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # gui editor
    geany
    # terminal session manager
    tmux
    # background
    hyprpaper
    # dmenu
    fuzzel
    # nix language server
    nil
    # nix formatter
    nixfmt
    # terminal git
    lazygit
    # find ...
    fd
    # funny man
    tldr
    # clipboard
    wl-clipboard
    # show color
    pastel
    # brightness key
    brightnessctl
    # volume key
    playerctl
    # music + video
    spotify
    vlc
    # pictures
    gimp
    imv

  ];

  programs = {
    # terminal fuzzy search
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
