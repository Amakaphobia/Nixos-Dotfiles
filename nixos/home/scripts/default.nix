{ lib, ... }:
let
  sessionPath = "$HOME/.local/bin";
  scriptsDirectory = ./scripts;

  shellScripts = lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".sh" name) (
    builtins.readDir scriptsDirectory
  );
in
{
  home.file = lib.mapAttrs' (
    filename: _:
    lib.nameValuePair ".local/bin/${lib.removeSuffix ".sh" filename}" {
      source = scriptsDirectory + "/${filename}";
      executable = true;
    }
  ) shellScripts;

  home.sessionPath = [
    sessionPath
  ];
}
