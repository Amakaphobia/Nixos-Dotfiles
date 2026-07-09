{ config, pkgs, ... }:

let
    dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    configs = {
    	hypr = "hypr";
    };
in
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

#      ./home/hypr/hypridle.nix
#      ./home/hypr/hyprlock.nix
    ];

    home = {
    	username = "dave";
      homeDirectory = "/home/dave";
      stateVersion = "26.05";
    };

    
    
    # Setting Configpaths

    # This itterates over the configs set declared at the top and sets symlinks for each entry
    xdg.configFile = builtins.mapAttrs(name: subpath: {
	source = create_symlink "${dotfiles}/${subpath}";
	recursive = true;
    })
    configs;

}
