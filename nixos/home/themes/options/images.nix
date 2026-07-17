{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  # create user options for wallpaper and lockscreen
  options.dave.theme = {
    wallpaper = mkOption {
      type = types.path;
      description = "Wallpaper";
    };

    lockscreen = mkOption {
      type = types.path;
      description = "Lockscreen";
    };
  };
}
