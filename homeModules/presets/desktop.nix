{ lib, config, ... }:
{
  options = {
    myHome.presets.desktop.enable = lib.mkEnableOption "Enable desktop presets";
  };

  config = lib.mkIf config.myHome.presets.desktop.enable {
    myHome = {
      virtualisation = {
        virt-manager.enable = lib.mkDefault true;
      };
    };
  };
}
