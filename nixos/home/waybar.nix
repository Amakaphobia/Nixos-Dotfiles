{ ... }:

{
  programs.waybar = {
    enable = true;
    # autostart:
    systemd.enable = true;

    settings = {
      mainbar = {
        layer = "top";
        position = "top";
        # height = 50;
        width = 1720;
        spacing = 0;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
          # this is a active window name display I dont really need
          #   "hyprland/window"
        ];
        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "battery"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";

          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "0";
          };
        };

        clock = {
          interval = 60;
          format = "{:%A, %H:%M}";
          tooltip-format = "{:%d %B %Y}";
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
        .modules-left,
        .modules-center,
        .modules-right {
          background:transparent;
          border-radius: 6px;
          box-shadow:
            inset 0 0 4px #11111b,
            inset 0 0 10px #585b70; 
        }

        window#waybar {
           background: transparent;
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
          background: transparent;
          border-radius: 6px;
          padding: 0px 10px;
      	  margin: 5px 5px;
        }

        #workspaces button {
          min-width: 60px;
          color: #cba6f7;
          background: transparent;
          border: 1px solid;
          border-color: #cba6f7;
          padding: 0px 0px;
          margin: 5px 5px;
          box-shadow: none;
          text-shadow: none;
        }

        #workspaces button.active {
            box-shadow:
            inset 0 0 4px rgba(203, 166, 247, 0.9),
            inset 0 0 10px rgba(203, 166, 247, 0.45); 
        }

        /* force workspace icons to be centered */  
        #workspaces button label {
          padding: 0px;
          margin: 0px;
        }
    '';
  };
}
