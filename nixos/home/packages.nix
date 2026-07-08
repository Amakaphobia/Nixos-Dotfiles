{ pkgs, ... }:

{
    home.packages = with pkgs; [
        kdePackages.dolphin
        kdePackages.kate
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
        spotify
        vlc
        gimp

    ];

    programs = {
      fzf = {
        enable = true;
        enableZshIntegration = true;
      };
    };
}
