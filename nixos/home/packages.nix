{ pkgs, ... }:

{
    home.packages = with pkgs; [
        kdePackages.dolphin
        kdePackages.kate
        kitty
        tmux
        hyprpaper
        hyprlock
        hypridle
        fuzzel
      	nil
      	nixpkgs-fmt
        lazygit
        fd
        tldr
    	wl-clipboard
	pastel 
        spotify-player
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
