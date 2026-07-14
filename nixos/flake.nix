{
  description = "First Flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # temporarily pin this commit. It fixes waybar hyprland lua interaction
    waybar = {
      url = "github:Alexays/Waybar/05945748dccce28bf96d26d8f64a9e69a8dd49ba";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # @ syntax : name all of it inputs, but pull out the named variables and make them locally available
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";

      legacy = nixpkgs.legacyPackages.${system};

      flakePath = "/home/dave/nixos-dotfiles/nixos";

      homeModulesPath = ./home/modules;

      wallpapersPath = ../wallpapers;

      nixModulesPath = ./modules;
    in
    {
      nixosConfigurations.nyx = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit
            inputs
            self
            flakePath
            nixModulesPath
            ;
        };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = {
                inherit
                  inputs
                  flakePath
                  homeModulesPath
                  wallpapersPath
                  ;
              };
              users.dave = import ./home/users/dave;
              backupFileExtension = "backup";
            };
          }
        ];
      };

      formatter.${system} = legacy.nixfmt-tree;
    };
}
