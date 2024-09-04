{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    myHome.programs.rofi-wayland.enable = lib.mkEnableOption "Enable rofi-wayland";
  };

  config = lib.mkIf config.myHome.programs.rofi-wayland.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
    };
  };
}
