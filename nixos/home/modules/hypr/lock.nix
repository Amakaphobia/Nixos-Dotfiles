{ config, ... }:
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

        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
        ];

        animation = [
          "fadeIn, 1, 3, easeOutQuint"
          "fadeOut, 1, 3, easeOutQuint"
        ];
      };
      background = [
        {
          monitor = "";
          path = "${config.dave.theme.images.lockscreen}";
        }
      ];

      input-field = [
        {
          size = "200, 50";

          halign = "center";
          valign = "center";
          position = "0, -10%";
          monitor = "";

          dots_center = true;
          fade_on_empty = false;

          font_color = "rgb(36,39,58)";
          inner_color = "rgb(194,157,241)";
          outer_color = "rgb(26, 24, 35)";

          outline_thickness = 5;
          placeholder_text = "Speak Friend and enter";
          shadow_passes = 2;
        }
      ];
    };
  };
}
