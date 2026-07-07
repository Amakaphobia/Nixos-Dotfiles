{ pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      animations = {
        enabled = true;
        fade_in = {
          duration = 300;
          bezier = "easeOutQuint";
        };
        fade_out = {
          duration = 300;
          bezier = "easeOutQuint";
        };
      };
      
      background = [
        {
          path = "~/nixos-dotfiles/wallpapers/currentLock";
        }
      ];

      inputfield = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = true;

          font_color = "rgb()";
          inner_color = "rgb()";
          outer_color = "rgb()";

          outline_thickness = 5;
          placeholder_text = "Speak Friend and enter";
          shadow_passes = 2;
        }
      ];
    };
    
  };
  security.pam.services.hyprlock = {};
}
