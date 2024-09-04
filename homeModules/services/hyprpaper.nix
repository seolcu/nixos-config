{ lib, config, ... }:
{
  options = {
    myHome.services.hyprpaper.enable = lib.mkEnableOption "Enable hyprpaper";
  };

  config = lib.mkIf config.myHome.services.hyprpaper.enable {
    services.hyprpaper.enable = true;
  };
}
