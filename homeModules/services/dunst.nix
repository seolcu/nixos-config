{ lib, config, ... }:
{
  options = {
    myHome.services.dunst.enable = lib.mkEnableOption "Enable dunst";
  };

  config = lib.mkIf config.myHome.services.dunst.enable {
    services.dunst.enable = true;
  };
}
