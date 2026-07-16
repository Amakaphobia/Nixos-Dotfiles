{
  config,
  lib,
  ...
}:
let
  colorsLib = import ../../lib/colors.nix {
    inherit lib;
  };

  colors = config.dave.theme.scheme.roles;

  colorDefinitions = colorsLib.toGtkCss colors;

  makeStylesheet = stylesheet: ''
    ${colorDefinitions}

    ${builtins.readFile stylesheet}
  '';
in
{
  gtk = {
    enable = true;
    colorScheme = "dark";
    gtk3.extraCss = makeStylesheet ./gtk3.css;
    gtk4.extraCss = makeStylesheet ./gtk4.css;
  };
}
