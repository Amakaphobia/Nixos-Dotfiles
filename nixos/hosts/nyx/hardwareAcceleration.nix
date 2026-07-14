{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    # VA-API driver for modern intel gpus
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
