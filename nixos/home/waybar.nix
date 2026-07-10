{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainbar = {
        layer = "top";
        position = "left";
        # height = 50;
        width = 60;
        spacing = 0;
        modules-right = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
          # this is a active window name display I dont really need
          #   "hyprland/window"
        ];
        modules-left = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "battery"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";

          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
            urgent = "!";
            active = "●";
            default = "○";
          };
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 60;
          separate-outputs = true;
          expand = true;

          align = 0.5;
          justify = "center";
        };

        clock = {
          interval = 60;
          format = "{0:%d.%m}\n{0:%H:%M}";
          tooltip-format = "{:%A, %d %B %Y}";
          align = 0.5;
          justify = "center";
        };
      };
    };

    style = ''
         * {
           font-family: "JetBrainsMono Nerd Font";
           font-size: 10px;
         }
          
         window#waybar {
           background: rgba(20, 20, 28, 0.92);
           color: #cdd6f4;
      	   border: 1px solid yellow;
        }

        tooltip {
          background: #1e1e2e;
          border: 1px solid #89b4fa;
          border-radius: 8px;
        }
          
        tooltip label {
          color: #cdd6f4;
          padding: 6px;
        }
          
        #clock {
      	  border: 1px solid red;
          padding: 3px 2px;
      	  margin: 2px;
      	  color: #f5c2e7;
       }

      /* this styles the hyprland/window widget */
      /*

      window#waybar.empty #window,
      window#waybar.solo #window,
      window#waybar:not(.solo) #window,
      window#waybar.floating #window,
      window#waybar.fullscreen #window,
      window#waybar.swallowing #window {
        color: #cdd6f4;
        background: transparent;
        border: 1px solid green;
        margin: 2px 5px;
        margin-top: 20px;
      }

      */

      #workspaces button {
        color: #cba6f7;
        background: transparent;
        border: 1px solid;
        border-color: #cba6f7;
        padding: 2px 0;
        margin: 2px 5px;
        box-shadow: none;
        text-shadow: none;
      }
                  
    '';
  };
}
