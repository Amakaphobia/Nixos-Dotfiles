{ config, pkgs, ... }:

let
    dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    configs = {
    	kitty = "kitty";
    	hypr = "hypr";
    };
in
{
    imports = [
      ./home/git.nix
      ./home/packages.nix
      ./home/zsh.nix
      ./home/obsidian.nix
      ./home/waybar.nix
      ./home/nvim.nix
      ./home/hypridle.nix
      ./home/hyprlock.nix
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
