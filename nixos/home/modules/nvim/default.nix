{
  config,
  pkgs,
  ...
}:

let
  nvimConfigDirectory = "/home/dave/nixos-dotfiles-refactor/nixos/home/modules/nvim/config";
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # Do not create ~/.config/nvim/init.lua.
    # Load Home Manager's generated initialization through
    # Neovim's wrapper instead.
    sideloadInitLua = true;

    # make these available to nvims exectution environment
    extraPackages = with pkgs; [

      # plugin installation
      git
      curl
      unzip
      gcc
      gnumake

      # search + navigation
      ripgrep
      fd
      fzf

      # utility library
      glib

      #optional integrations
      lazygit
      tree-sitter

      #lua language support
      lua-language-server
      stylua

      #shell formatter
      shfmt

      # JSON and JSONC formatter
      prettier

      #nix language support
      nil
      nixfmt
      statix
    ];

  };
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimConfigDirectory;
}
