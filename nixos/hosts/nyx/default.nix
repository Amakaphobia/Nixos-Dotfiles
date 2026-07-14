{ ... }:
{
  networking.hostName = "nyx"; # Define your hostname.

  imports = [
    ./hardware-configuration.nix
  ];
}
