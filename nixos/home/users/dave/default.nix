{ modulePath, wallpaperPath, ... }:

{
  imports = [
    # process monitor
    (modulePath + "/btop.nix")
    # firefox user profiles
    (modulePath + "/firefox.nix")
    # git
    (modulePath + "/git.nix")
    # terminal
    (modulePath + "/kitty.nix")
    # editor
    (modulePath + "/nvim")
    # knowledge
    (modulePath + "/obsidian")
    # stuff
    (modulePath + "/packages.nix")
    # polkit
    (modulePath + "/polkit.nix")
    # prompt
    (modulePath + "/starship.nix")
    # sway notification center
    (modulePath + "/swaync.nix")
    # theme
    (modulePath + "/theme.nix")
    # statusbar
    (modulePath + "/waybar")
    # how sandboxed/wayland apps ask for desktop features
    (modulePath + "/xdg.nix")
    # better cd
    (modulePath + "/zoxide.nix")
    # shell
    (modulePath + "/zsh.nix")
    # hypr
    (modulePath + "/hypr")
    # screenshots
    (modulePath + "/screenshot.nix")

  ];

  dave.theme = {
    wallpaper = wallpaperPath + "/waifu/AngelBlue.png";
    lockscreen = wallpaperPath + "/waifu/purplegirl.jpeg";
  };

  home = {
    username = "dave";
    homeDirectory = "/home/dave";
    stateVersion = "26.05";
  };
}
