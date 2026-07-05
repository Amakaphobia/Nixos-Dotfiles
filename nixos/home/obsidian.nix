{ pkgs, ... }:

{
  programs.obsidian = {
    enable = true;
    
#enable command line support in obsidian
    cli.enable = true;

# Vault settings
    vault = {
      main = {
        target = "todovault";

        settings = {

          app = {
            alwaysUpdateLinks = true;
          };
        };
      };

    };
  };
    
}
