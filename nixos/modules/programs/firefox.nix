{ ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      HardwareAcceleration = true;
      SearchEngines.Default = "DuckDuckGo";
    };
    preferences = {
      "media.ffmpeg.vaapi.enabled" = true;

      # Fonts
      # make sure websites may use the fontsthey prefer
      "browser.display.use_document_fonts" = 1;
      # Primary Firefox fonts
      "font.name.sans-serif.x-western" = "Noto Sans";
      "font.name.serif.x-western" = "Noto Serif";
      "font.name.monospace.x-western" = "JetBrainsMono Nerd Font Mono";
      # Fallback chains
      "font.name-list.sans-serif.x-western" = "Noto Sans, Symbols Nerd Font";
      "font.name-list.serif.x-western" = "Noto Serif, Symbols Nerd Font";
      "font.name-list.monospace.x-western" = "JetBrainsMono Nerd Font Mono, Symbols Nerd Font Mono";
      # Used by some content that Firefox classifies as general Unicode
      "font.name-list.sans-serif.x-unicode" = "Noto Sans, Symbols Nerd Font";
      "font.name-list.serif.x-unicode" = "Noto Serif, Symbols Nerd Font";
      "font.name-list.monospace.x-unicode" = "JetBrainsMono Nerd Font Mono, Symbols Nerd Font Mono";
    };
  };
}
