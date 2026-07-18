{ pkgs, ... }:

{
  programs.btop = {
    enable = true;

    settings = {
      theme_background = false;
      update_ms = 1000;
      vim_keys = true;
    };
  };
}
