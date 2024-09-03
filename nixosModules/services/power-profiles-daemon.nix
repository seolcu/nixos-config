{ lib, config, ... }:
{
  options = {
    myNixOS.services.power-profiles-daemon.enable = lib.mkEnableOption "Enable Power Profiles Daemon";
  };

  config = lib.mkIf config.myNixOS.services.power-profiles-daemon.enable {
    services.power-profiles-daemon.enable = true;
  };
}
