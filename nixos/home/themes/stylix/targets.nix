{ ... }:
{

  config.stylix = {
    targets = {
      # allow fints to be configured
      font-packages.enable = true;
      fontconfig.enable = true;

      # style gtk
      gtk.enable = true;

      # style kitty but keep colors on manual
      kitty = {
        enable = true;
        colors.enable = false;
      };
    };
    opacity.terminal = 0.85;
  };
}
