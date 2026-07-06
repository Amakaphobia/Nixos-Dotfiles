{ pkgs, ... }:
let
  catppuccinObsidian = pkgs.stdenvNoCC.mkDerivation {
    pname = "myCatppuccin";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "obsidian";
      rev = "1e7aabc47addeefe79dd0362c9976dfa3367c1f9";
      hash = "sha256-9fSFj9Tzc2aN9zpG5CyDMngVcwYEppf7MF1ZPUWFyz4=";
    };

    installPhase = ''
      mkdir -p $out
      cp manifest.json theme.css $out/
    '';
  };
in
{
  programs.obsidian = {
    enable = true;
    
# enable command line support in obsidian
    cli.enable = true;

# defaults - will be overriden by vault settings if applicable
    defaultSettings = {

          app = {
            alwaysUpdateLinks = true;
	    vimMode = true;
          };
	corePlugins = [
	    "backlink"
	    "bases"
	    "bookmarks"
	    "canvas"
	    "command-palette"
	    "daily-notes"
	    "file-explorer"
	    "footnotes"
	    "global-search"
	    "graph"
	    "note-composer"
	    "outline"
	    "page-preview"
	    "properties"
	    "slash-command"
	    "switcher"
	    "templates"
	    "word-count"
	];

	communityPlugins = [
  	    
	];
    };



# Vault settings
    vaults = {
      main = {
        target = "todovault";
        settings = {  
            themes = [catppuccinObsidian];
            appearance = {
                theme = "obsidian";
            };
        };
      };
      };
    };
}
