{ lib, config, ... }:
{
  options = {
    myHome.virtualisation.virt-manager.enable = lib.mkEnableOption "Enable virt-manager";
  };

  config = lib.mkIf config.myHome.virtualisation.virt-manager.enable {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}
