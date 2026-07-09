{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    # nix highlighting without treesitter might need to change later
    ####
    plugins = with pkgs.vimPlugins; [
      vim-nix
    ];

    extraConfig = ''
      	    syntax enable
      	    filetype plugin indent on
      	'';

    ####

    # show current line
    # show relative line
    initLua = ''
      	    vim.opt.number = true
      	    vim.opt.relativenumber = true
      	'';
  };
}
