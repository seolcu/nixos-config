{ lib, config, ... }:
{
  options = {
    myNixOS.services.libinput.enable = lib.mkEnableOption "Enable libinput";
  };

  config = lib.mkIf config.myNixOS.services.libinput.enable {
    # Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;
  };
}
