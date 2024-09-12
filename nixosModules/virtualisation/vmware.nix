{ lib, config, ... }:
{
  options = {
    myNixOS.virtualisation.vmware.enable = lib.mkEnableOption "Enable VMWare";
  };

  config = lib.mkIf config.myNixOS.virtualisation.vmware.enable {
    virtualisation.vmware = {
      host.enable = true;
      guest.enable = true;
    };
    services.xserver.videoDrivers = [ "vmware" ];
  };
}
