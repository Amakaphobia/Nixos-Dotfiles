{ ... }:
{

  config.stylix.targets = {
    font-packages.enable = true;
    fontconfig.enable = true;
    kitty = {
      enable = true;

      colors.enable = false;
    };
    opacity.terminal = 0.85;
  };
}
