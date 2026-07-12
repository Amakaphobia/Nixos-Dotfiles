{ pkgs, lib, ... }:
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
  anuPpuccinObsidian = pkgs.stdenvNoCC.mkDerivation {
    pname = "anuPpuccinObsidian";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "AnubisNekhet";
      repo = "AnuPpuccin";
      rev = "93edd678ee5f2e090479f1807dfe13c71fc22720";
      hash = "sha256-T66bh2dTk15HbCKaruMOYPbExO150mrPfAQeNVz56bs=";
    };

    nativeBuildInputs = [ pkgs.dart-sass ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp manifest.json theme.css $out/
      runHook postInstall
    '';
  };

  styleSettings = pkgs.stdenvNoCC.mkDerivation rec {
    pname = "obsidian-style-settings";
    version = "1.0.9";

    manifest = pkgs.fetchurl {
      url = "https://github.com/obsidian-community/obsidian-style-settings/releases/download/${version}/manifest.json";
      hash = "sha256-nP/cIM8qoTVIIOAFC2lLD5tXZEbj1dRKNq6LAYflv7g=";
    };

    mainJs = pkgs.fetchurl {
      url = "https://github.com/obsidian-community/obsidian-style-settings/releases/download/${version}/main.js";
      hash = "sha256-GCirqs2rTFV4twWmJcWFswUS+O+tTHz8WhjnDMNVdGg=";
    };

    styleCss = pkgs.fetchurl {
      url = "https://github.com/obsidian-community/obsidian-style-settings/releases/download/${version}/styles.css";
      hash = "sha256-7nk30r5QZTqJzLMK5fBXKyNQfVt/EyjQBScaNjB1v9g=";
    };

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out
      cp ${manifest} $out/manifest.json
      cp ${mainJs} $out/main.js
      cp ${styleCss} $out/styles.css
    '';
  };
  dataview = pkgs.stdenvNoCC.mkDerivation rec {

    pname = "obsidian-dataview";
    version = "0.5.68";

    manifest = pkgs.fetchurl {
      url = "https://github.com/blacksmithgu/obsidian-dataview/releases/download/${version}/manifest.json";
      hash = "sha256-kjXbRxEtqBuFWRx57LmuJXTl5yIHBW6XZHL5BhYoYYU=";
    };

    mainJs = pkgs.fetchurl {
      url = "https://github.com/blacksmithgu/obsidian-dataview/releases/download/${version}/main.js";
      hash = "sha256-eU6ert5zkgu41UsO2k9d4hgtaYzGOHdFAPJPFLzU2gs=";
    };

    stylesCss = pkgs.fetchurl {
      url = "https://github.com/blacksmithgu/obsidian-dataview/releases/download/${version}/styles.css";
      hash = "sha256-MwbdkDLgD5ibpyM6N/0lW8TT9DQM7mYXYulS8/aqHek=";
    };

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out

      cp ${manifest} $out/manifest.json
      cp ${mainJs} $out/main.js
      cp ${stylesCss} $out/styles.css
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

      # Plugins

      corePlugins = [
        {
          name = "backlink";
          settings = {
            backlinkInDocument = true;
          };
        }
        "bases"
        "bookmarks"
        {
          name = "canvas";
          settings = {
            snapToObjects = true;
            snapToGrid = true;
            zoomBreakpoint = 0.8;
            defaultWheelBehavior = "zoom";
          };
        }
        "command-palette"
        {
          name = "daily-notes";
          settings = {
            folder = "05 - Journal/daily Notes";
          };
        }
        "editor-status"
        "file-explorer"
        "footnotes"
        "global-search"
        "graph"
        "note-composer"
        "outline"
        "page-preview"
        "properties"
        "slash-command"
        {
          name = "switcher";
          settings = {
            showExistingOnly = true;
            showAttachments = true;
            showAllFileTypes = false;
          };
        }
        "templates"
        "word-count"
      ];

      communityPlugins = [
        {
          pkg = styleSettings;
          settings = builtins.fromJSON (
            builtins.readFile ./obsidian/plugins/obsidian-style-settings/data.json
          );
        }
        {
          pkg = dataview;
        }
      ];
    };

    # Vault settings
    vaults = {
      main = {
        target = "todovault";
        settings = {
          themes = [
            # catppuccinObsidian
            anuPpuccinObsidian
          ];
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
