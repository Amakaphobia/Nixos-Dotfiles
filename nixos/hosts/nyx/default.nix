{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./hardware-acceleration.nix

    ../../profiles/core.nix
    ../../profiles/desktop.nix
    ../../profiles/laptop.nix

    ../../users/dave.nix

  ];

  networking.hostName = "nyx"; # Define your hostname.
  system.stateVersion = "26.05"; # No changerino!
}
