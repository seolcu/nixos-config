{ lib, config, ... }:
{
  options = {
    myNixOS.services.fwupd.enable = lib.mkEnableOption "Enable fwupd support";
  };

  config = lib.mkIf config.myNixOS.services.fwupd.enable {
    services.fwupd.enable = true;
  };
}
