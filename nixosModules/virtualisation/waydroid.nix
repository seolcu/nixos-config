{ lib, config, ... }:
{
  options = {
    myNixOS.virtualisation.waydroid.enable = lib.mkEnableOption "Enable WayDroid";
  };

  config = lib.mkIf config.myNixOS.virtualisation.waydroid.enable {
    virtualisation.waydroid.enable = true;
  };
}
