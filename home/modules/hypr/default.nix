{ pkgs, ... }:

{

  # hypr ecosystem:
  imports = [
    ./land.nix
    ./idle.nix
    ./paper.nix
    ./lock.nix
  ];

  home.packages = with pkgs; [
    hyprshutdown
  ];
}
