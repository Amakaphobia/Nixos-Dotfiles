{ homeModulesPath, ... }:
{

  imports = [
    # process homeMonitor
    (homeModulesPath + "/btop.nix")
    # firefox user profiles
    (homeModulesPath + "/firefox.nix")
    # git
    (homeModulesPath + "/git.nix")
    # terminal
    (homeModulesPath + "/kitty.nix")
    # editor
    (homeModulesPath + "/nvim")
    # knowledge
    (homeModulesPath + "/obsidian")
    # stuff
    (homeModulesPath + "/packages.nix")
    # polkit
    (homeModulesPath + "/polkit.nix")
    # prompt
    (homeModulesPath + "/starship.nix")
    # sway notification center
    (homeModulesPath + "/swaync.nix")
    # theme
    (homeModulesPath + "/theme.nix")
    # statusbar
    (homeModulesPath + "/waybar")
    # how sandboxed/wayland apps ask for desktop features
    (homeModulesPath + "/xdg.nix")
    # better cd
    (homeModulesPath + "/zoxide.nix")
    # shell
    (homeModulesPath + "/zsh.nix")
    # hypr
    (homeModulesPath + "/hypr")
    # screenshots
    (homeModulesPath + "/screenshot.nix")

  ];
}
