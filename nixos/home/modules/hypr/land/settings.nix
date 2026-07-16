{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    config = {
      # defalt layout is scrolling
      general.layout = "scrolling";

      master = {
        orientation = "left";
      };

      scrolling = {
        fullscreen_on_one_column = true;
      };
    };
  };
}
