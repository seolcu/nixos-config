{ lib, config, ... }:
{
  options = {
    myHome.programs.mpv.enable = lib.mkEnableOption "Enable mpv";
  };

  config = lib.mkIf config.myHome.programs.mpv.enable {
    programs.mpv = {
      enable = true;
    };
  };
}
