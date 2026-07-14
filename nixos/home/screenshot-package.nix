{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # screenshot
    grim
    # geometry selection
    slurp
    # annotations
    satty
  ];
}
