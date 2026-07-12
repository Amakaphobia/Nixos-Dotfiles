{ ... }:
{
  programs.firefox = {
    enable = true;

    # firefox is installed on system level
    package = null;

    profiles.default = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      # override githubs code views with my font stack
      userContent = ''
        @-moz-document domain("github.com") {
          .blob-code,
          .blob-code-inner,
          .react-code-text {
            font-family:
              "JetBrainsMono Nerd Font Mono",
              "Symbols Nerd Font Mono",
              ui-monospace,
              monospace !important;
          }
        }
      '';
    };
  };
}
