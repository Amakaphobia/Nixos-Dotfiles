{ config, pkgs, ... }:

{
  imports = [
    # process monitor
    ./home/btop.nix
    # git
    ./home/git.nix
    # terminal
    ./home/kitty.nix
    # editor
    ./home/nvim.nix
    # knowledge
    ./home/obsidian.nix
    # stuff
    ./home/packages.nix
    # prompt
    ./home/starship.nix
    # theme
    ./home/system-theme.nix
    # statusbar
    ./home/waybar.nix
    # how sandboxed/wayland apps ask for desktop features
    ./home/xdg.nix
    # better cd
    ./home/zoxide.nix
    # shell
    ./home/zsh.nix
    # hypr
    ./home/hypr/hypr.nix


  ];

  home = {
    username = "dave";
    homeDirectory = "/home/dave";
    stateVersion = "26.05";
  };
}
