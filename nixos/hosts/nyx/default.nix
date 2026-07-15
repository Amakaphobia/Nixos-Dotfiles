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

  # thermald proactively prevents overheating on Intel CPUs
  services.themald.enable = true;

  networking.hostName = "nyx"; # Define your hostname.
  system.stateVersion = "26.05"; # No changerino!
}
