{ userModulePath, userWallpaperPath, ... }:

{
  imports = [
    # process monitor
    "${userModulePath}/btop.nix"
    # firefox user profiles
    "${userModulePath}/firefox.nix"
    # git
    "${userModulePath}/git.nix"
    # terminal
    "${userModulePath}/kitty.nix"
    # editor
    "${userModulePath}/nvim"
    # knowledge
    "${userModulePath}/obsidian"
    # stuff
    "${userModulePath}/packages.nix"
    # polkit
    "${userModulePath}/polkit.nix"
    # prompt
    "${userModulePath}/starship.nix"
    # sway notification center
    "${userModulePath}/swaync.nix"
    # theme
    "${userModulePath}/theme.nix"
    # statusbar
    "${userModulePath}/waybar"
    # how sandboxed/wayland apps ask for desktop features
    "${userModulePath}/xdg.nix"
    # better cd
    "${userModulePath}/zoxide.nix"
    # shell
    "${userModulePath}/zsh.nix"
    # hypr
    "${userModulePath}/hypr"
    # screenshots
    "${userModulePath}/screenshot.nix"

  ];

  dave.theme = {
    wallpaper = "${userWallpaperPath}/waifu/AngelBlue.png";
    lockscreen = "${userWallpaperPath}/waifu/purplegirl.jpeg";
  };

  home = {
    username = "dave";
    homeDirectory = "/home/dave";
    stateVersion = "26.05";
  };
}
