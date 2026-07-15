{ ... }:
{
  imports = [
    ./cursor/bibata-original-ice.nix

    ./themeoptions.nix
  ];
  config = {
    gtk.enable = true;

    dconf.settings."org/gnome/desktop/interface" = {
      # set dark as default
      color-scheme = "prefer-dark";
    };

  };

}
