{ pkgs, ... }:

{
    home.packages = with pkgs; [
        kdePackages.dolphin
        kdePackages.kate
        kitty
        tmux
        hyprpaper
        fuzzel
      	nil
      	nixpkgs-fmt
        lazygit
        fd
        tldr
    	wl-clipboard
	pastel 
        brightnessctl
        playerctl
    ];

    programs = {
      fzf = {
        enable = true;
        enableZshIntegration = true;
      };
    };
}
