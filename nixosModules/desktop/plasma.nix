{ lib, config, ... }:
{
  options = {
    myNixOS.desktop.plasma.enable = lib.mkEnableOption "Enable Plasma 6";
  };

  config = lib.mkIf config.myNixOS.desktop.plasma.enable {
    services = {
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
      desktopManager.plasma6.enable = true;
    };
    myNixOS.desktop.enable = true;
  };
}
