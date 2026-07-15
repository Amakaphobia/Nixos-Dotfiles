{ ... }:

{
  imports = [
    ./packages.nix
    ./theme.nix
  ];

  home = {
    username = "dave";
    homeDirectory = "/home/dave";
    stateVersion = "26.05";
  };
}
