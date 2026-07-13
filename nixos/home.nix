{ ... }:

{
  imports = [
    # process monitor
    ./home/btop.nix
    # firefox user profiles
    ./home/firefox.nix
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
    # polkit
    ./home/polkit.nix
    # prompt
    ./home/starship.nix
    # sway notification center
    ./home/swaync.nix
    # theme
    ./home/theme.nix
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

  dave.theme = {
    wallpaper = ../wallpapers/waifu/AngelBlue.png;
    lockscreen = ../wallpapers/waifu/purplegirl.jpeg;
  };

  home = {
    username = "dave";
    homeDirectory = "/home/dave";
    stateVersion = "26.05";
  };
}
