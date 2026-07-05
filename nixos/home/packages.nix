{ pkgs, ... }:

{
    home.packages = with pkgs; [
        kdePackages.dolphin
        kdePackages.kate
        neovim
        kitty
        tmux
        hyprpaper
        hyprlock
        fuzzel
      	nil
      	nixpkgs-fmt
        lazygit
        fd
        tldr
    	wl-clipboard
	pastel 
    ];
}
