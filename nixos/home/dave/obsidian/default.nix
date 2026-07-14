{ ... }:
{
  imports = [
    ./core-plugins.nix
    ./plugins
    ./themes
  ];

  programs.obsidian = {
    enable = true;

    # enable command line support in obsidian
    cli.enable = true;

    # defaults - will be overriden by vault settings if applicable
    defaultSettings = {

      app = {
        alwaysUpdateLinks = true;
        vimMode = true;

        # open in editing mode
        defaultViewMode = "source";
        # do not use live preview
        livePreview = false;

        # Editor
        showLineNumber = true;
        # activate spellcheck
        spellcheck = true;
        spellcheckLanguages = [
          "en-US"
          "de-DE"
        ];
      };

      # Hotkeys

      hotkeys = {
        # Remove C-N form the command that reuses the current tab.
        "file-explorer:new-file" = [ ];
        # Make C-N create a note in a new tab
        "file-explorer:new-file-in-new-pane" = [
          {
            modifiers = [ "Mod" ];
            key = "N";
          }
        ];
      };

    };

    # Vault settings
    vaults = {
      main = {
        target = "todovault";
        settings = {
          appearance = {
            theme = "obsidian";

            interfaceFontFamily = "Noto Sans";
            textFontFamily = "Noto Serif";
            monospaceFontFamily = "JetBrainsMono Nerd Font Mono";
          };
        };
      };
    };
  };
}
