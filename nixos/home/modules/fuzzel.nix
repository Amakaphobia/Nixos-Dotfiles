{ config, lib, ... }:
let
  theme = config.dave.theme;
  colors = theme.scheme.roles;
in
{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        width = 50;
        lines = 10;

        font = lib.mkForce "Maple Mono NF:size=12";
      };

      colors.selection = lib.mkForce "${colors.background}ff";

      border = {
        width = 2;
        radius = 12;
      };
    };
  };
}
