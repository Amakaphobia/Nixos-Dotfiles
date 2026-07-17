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
          type = types.nullOr types.package;
          default = null;
        };
        name = mkOption {
          type = types.str;
          description = "Icon theme name exposed by the package.";
        };
      };
    };
  };
}
