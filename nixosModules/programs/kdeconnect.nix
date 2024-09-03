{ lib, config, ... }:
{
  options = {
    myNixOS.programs.kdeconnect.enable = lib.mkEnableOption "Enable KDE Connect";
  };

  config = lib.mkIf config.myNixOS.programs.kdeconnect.enable {
    programs.kdeconnect.enable = true;
  };
}
