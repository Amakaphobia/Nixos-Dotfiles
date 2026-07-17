{ lib, ... }:
let
  inherit (lib) mkOption types;
  fontOptions = lib.genAttrs [ "serif" "sansSerif" "monospace" "emoji" ] (
    name:
    mkOption {
      descriptions = "Default font for: ${name}";
      type = types.submodule {
        options = {
          package = mkOption {
            type = types.package;
          };
          name = mkOption {
            type = types.str;
          };
        };
      };
    }
  );

  sizeOptions = lib.genAttrs [ "desktop" "applications" "terminal" "popups" ] (
    name:
    mkOption {
      type = types.number;
      description = "default size for ${name}";
    }
  );
in
{
  # create font options
  options.dave.theme.typography = mkOption {
    description = "Typograhpy settings";
    fonts = fontOptions;
    sizes = sizeOptions;
  };
}
