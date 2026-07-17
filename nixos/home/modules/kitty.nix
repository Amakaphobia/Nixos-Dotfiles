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
  colors = config.dave.theme.scheme.roles;
in
{
  programs = {
    kitty = {
      enable = true;

      # TODO: remove and let stylix take this
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

      # keep manual control of colors because stylix doesnt map as well
      settings = config.dave.theme.scheme.terminal // {
        foreground = colorsLib.hex colors.foreground;
        background = colorsLib.hex colors.background;

        selection_foreground = colorsLib.hex colors.foreground;
        selection_background = colorsLib.hex colors.surface;

        cursor = colorsLib.hex colors.accent;
        cursor_text_color = colorsLib.hex colors.background;

        url_color = colorsLib.hex colors.info;

        active_border_color = colorsLib.hex colors.accent;
        inactive_border_color = colorsLib.hex colors.border;
        bell_border_color = colorsLib.hex colors.warning;

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
