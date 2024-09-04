{ lib, config, ... }:
{
  options = {
    myHome.services.clipman.enable = lib.mkEnableOption "Enable clipman";
  };

  config = lib.mkIf config.myHome.services.clipman.enable {
    services.clipman.enable = true;
  };
}
