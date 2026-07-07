{ pkgs, ... }:

{
  services.hypridle.settings = {
    enable = true;
    general = {
      after_sleep_cmd = "hyprctl dispatch dpms on";
      lock_cmd = "hyprlock";
    };
    listener = [
      {
        on-timeout = "hyprlock";
        timeout = 900;
      }
      {
        on-resume = "hyprctl dispatch dpms on";
        on-timeout = "hyprctl dispatch doms off";
        timeout = 1200;
      }
    ];
  };
};
