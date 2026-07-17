{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  options.dave.theme.icons = mkOption {
    description = "Desktop icon theme.";

    type = types.submodule {
      options = {
        package = mkOption {
          description = "Icon theme package";
          type = types.package;
          default = null;
        };
        name = mkOption {
          type = types.str;
          description = "Icon theme name";
        };
      };
    };
  };
}
