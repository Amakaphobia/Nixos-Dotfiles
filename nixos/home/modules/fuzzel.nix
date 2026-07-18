{ config, lib, ... }:
{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        width = 50;
        lines = 10;

        font = lib.mkForce "Maple Mono NF:size=12";
      };

      colors.selection = lib.mkForce "${config.dave.theme.scheme.roles.selection}ff";

      border = {
        width = 2;
        radius = 12;
      };
    };
  };
}
