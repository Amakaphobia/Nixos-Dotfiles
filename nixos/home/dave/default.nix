{ ... }:

{
  imports = [
    # process monitor
    ./btop.nix
    # firefox user profiles
    ./firefox.nix
    # git
    ./git.nix
    # terminal
    ./kitty.nix
    # editor
    ./nvim
    # knowledge
    ./obsidian
    # stuff
    ./packages.nix
    # polkit
    ./polkit.nix
    # prompt
    ./starship.nix
    # sway notification center
    ./swaync.nix
    # theme
    ./theme.nix
    # statusbar
    ./waybar
    # how sandboxed/wayland apps ask for desktop features
    ./xdg.nix
    # better cd
    ./zoxide.nix
    # shell
    ./zsh.nix
    # hypr
    ./hypr
    # screenshots
    ./screenshot.nix

  ];

  dave.theme = {
    wallpaper = ../../../wallpapers/waifu/AngelBlue.png;
    lockscreen = ../../../wallpapers/waifu/purplegirl.jpeg;
  };

  home = {
    username = "dave";
    homeDirectory = "/home/dave";
    stateVersion = "26.05";
  };
}
