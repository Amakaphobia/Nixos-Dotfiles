{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  # cursor
  options.dave.theme.cursor = mkOption {
    description = "Desktop cursor theme.";

    type = types.submodule {
      options = {
        package = mkOption {
          type = types.package;
        };
        name = mkOption {
          type = types.str;
        };
        size = mkOption {
          type = types.int;
        };
      };
    };
  };
}
