{ lib, config, ... }:
{
  options = {
    myHome.programs.swaylock.enable = lib.mkEnableOption "Enable swaylock";
  };

  config = lib.mkIf config.myHome.programs.swaylock.enable {
    programs.swaylock = {
      enable = true;
    };
  };
}
