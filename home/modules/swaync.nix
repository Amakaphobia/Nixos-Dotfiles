{ config, lib, ... }:

let
  popupOpacity = toString config.stylix.opacity.popups;
in
{
  services.swaync = {
    enable = true;

    style = lib.mkAfter ''
      /*
       * append the stylix-set background opacity that did not get consumed by swaync
       */

      .notification-content,
      .control-center,
      .control-center .notification-row .notification-background,
      .control-center .notification-row .notification-background:hover {
        background: alpha(@base00, ${popupOpacity});
      }

      .control-center .notification-row .notification-background:active {
        background: alpha(@base0F, ${popupOpacity});
      }
    '';
  };
}
