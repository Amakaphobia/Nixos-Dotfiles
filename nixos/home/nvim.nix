{ pkgs, ... }:

{
    programs.nvim = {
        enable = true;

	configure = ''
	    set number
	    set relativenumber
	'';
    };
}
