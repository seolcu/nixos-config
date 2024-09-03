{ lib, config, ... }:
{
  options = {
    myNixOS.services.flatpak.enable = lib.mkEnableOption "Enable Flatpak support";
  };

  config = lib.mkIf config.myNixOS.services.flatpak.enable {
    services.flatpak.enable = true;
  };
}
