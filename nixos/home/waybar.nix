{ pkgs, ... }:

{
    programs.waybar = {
	enable = true;

	settings = {
	    mainbar = {
		layer = "top";
		position = "left";
		# height = 50;
		width = 40;
		spacing = 0;
                modules-right = [
                    "hyprland/workspaces"
                    "hyprland/window"
        	];
		modules-center = [
		    "clock"
		];
	    	modules-left= [
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

                "hyprland/window" = {
                    format = "{}";
                    max-length = 60;
                    separate-outputs = true;
                };

                clock = {
                    interval = 60;
                    format = "{:%a %d %b  %H:%M}";
                    tooltip-format = "{:%A, %d %B %Y}";
                };
              };
	    };
	};
	style = ''
            * {
              font-family: "JetBrainsMono Nerd Font";
              font-size: 13px;
            }
        
            window#waybar {
              background: rgba(20, 20, 28, 0.92);
              color: #cdd6f4;
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
              padding: 8px 0;
            }
          '';
    };
}
