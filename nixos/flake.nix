{
  description = "Fist Flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
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
    in
    {
      nixosConfigurations.nyx = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs self flakePath;
        };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.dave = import ./home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };

      formatter.${system} = legacy.nixfmt-tree;
    };
}
