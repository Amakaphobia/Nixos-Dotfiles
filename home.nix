{ config, pkgs, ... }:

let
    dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    configs = {
	kitty = "kitty";
	nvim = "nvim";
	hypr = "hypr";
    };
in
{
    home = {
	username = "dave";
        homeDirectory = "/home/dave";
         stateVersion = "26.05";
    };

    programs = {
        git.enable = true;

  	#Zsh
	zsh.enable = true;
 	zsh = {
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;
            shellAliases = {
                btw = "echo my config btw";
            };
        };
    };
	
    home.packages = with pkgs; [
        kdePackages.dolphin
        kdePackages.kate
        neovim
        waybar
        kitty
        tmux
        hyprpaper
        hyprlock
        fuzzel
      	nil
      	nixpkgs-fmt
        lazygit
        fd
    ];
    
    # Setting Configpaths

    # This itterates over the configs set declared at the top and sets symlinks for each entry
    xdg.configFile = builtins.mapAttrs(name: subpath: {
	source = create_symlink "${dotfiles}/${subpath}";
	recursive = true;
    })
    configs;

#   xdg.configFile."hypr" = {
#       source = create_symlink "${dotfiles}/hypr";
#       recursive = true;
#   };

#   xdg.configFile."kitty" = {
#       source = create_symlink "${dotfiles}/kitty";
#       recursive = true;
#   };
}
