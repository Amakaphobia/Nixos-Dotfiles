{ pkgs, ... }:

{
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "TTY";
      theme_background = false;
      update_ms = 1000;
      vim_keys = true;
    };
  };
}
