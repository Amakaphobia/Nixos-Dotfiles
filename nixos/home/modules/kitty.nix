{
  config,
  lib,
  pkgs,
  ...
}:
let
  colorsLib = import ../lib/colors.nix {
    inherit lib;
  };
  colors = config.dave.theme.roles;
in
{
  programs = {
    kitty = {
      enable = true;

      font = {
        name = "JetBrainsMono Nerd Font Mono";
        size = 12;
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      # C-R search history
      # C-T serch directory
      # A-C cd search
      # **<tab> fuzzy completion
      shellIntegration = {
        enableZshIntegration = true;

        mode = "no-cursor";
      };

      settings = colorsLib.toKitty config.dave.theme.scheme.terminal // {

        background_opacity = "0.85";

        foreground = colorsLib.hex colors.foreground;
        background = colorsLib.hex colors.background1;

        selection_foreground = colorsLib.hex colors.foreground;
        selection_background = colorsLib.hex colors.surface2;

        cursor = colorsLib.hex colors.accent1;
        cursor_text_color = colorsLib.hex colors.background1;

        url_color = colorsLib.hex colors.info2;

        active_border_color = colorsLib.hex colors.accent1;
        inactive_border_color = colorsLib.hex colors.border;
        bell_border_color = colorsLib.hex colors.warning2;

        # Usability
        scrollback_lines = 10000;
        enable_audio_bell = false;
        confirm_os_window_close = 0;

        # Appearance
        window_padding_width = 8;
        hide_window_decorations = true;

        # Mouse / URLs
        detect_urls = true;
        show_hyperlink_targets = "yes";
        underline_hyperlinks = "hover";
        open_url_with = "default";

        # Copy / paste safety
        strip_trailing_spaces = "smart";
        paste_actions = "quote-urls-at-prompt,confirm";
      };
    };
  };
}
