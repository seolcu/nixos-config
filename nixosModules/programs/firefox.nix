{ lib, config, ... }:
{
  options = {
    myNixOS.programs.firefox.enable = lib.mkEnableOption "Enable Firefox";
  };

  config = lib.mkIf config.myNixOS.programs.firefox.enable {
    programs.firefox.enable = true;
  };
}
