{ lib, config, ... }:
{
  options = {
    myHome.programs.imv.enable = lib.mkEnableOption "Enable imv";
  };

  config = lib.mkIf config.myHome.programs.imv.enable {
    programs.imv = {
      enable = true;
    };
  };
}
