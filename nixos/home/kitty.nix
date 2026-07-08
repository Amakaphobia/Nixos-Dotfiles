{ pkgs, ... }:

{
  programs = {
    kitty = {
      enable = true;

      font = {
        name = "JetBrainsMono Nerd Font Mono";
        size = 12;
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      shellIntegration = {
        enableZshIntegration = true;

        mode = "no-cursor";
      };

      autoThemeFiles = {
        light = "Novel";
        dark = "Catppuccin-Mocha";
        noPreference = "Catppuccin-Mocha";
      };

      settings = {
        background_opacity = "0.85";

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
