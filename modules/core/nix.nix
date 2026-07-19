{ ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      # Flakes
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };

    #automatic weekly garbage colletion, protects the current generation
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 60d";
    };
  };
}
