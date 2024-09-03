{ lib, config, ... }:
{
  options = {
    myNixOS.services.bluetooth.enable = lib.mkEnableOption "Enable Bluetooth support";
  };

  config = lib.mkIf config.myNixOS.services.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
