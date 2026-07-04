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
            enableCompletion = true;
            syntaxHighlighting.enable = true;
            autocd = true;
            history = {
              size = 10000;
              save = 10000;
              path = "$Home/.zsh_history";
              };
            shellAliases = {
              ll = "ls -lisa";
              gs = "git status";
              rebuild = "sudo nixos-rebuild switch --flake .";

              };
            initContent =''
              rebuild(){
                  if [ -z "$1" ]; then 
                    echo "Usage: rebuild hostname"
                    return 1
                  fi

                  sudo nixos-rebuild switch --flake ".#$1"
                }
            '';
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
