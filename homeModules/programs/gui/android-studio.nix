{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    myHome.programs.android-studio.enable = lib.mkEnableOption "Enable android-studio";
  };

  config = lib.mkIf config.myHome.programs.android-studio.enable {
    home.packages = with pkgs; [
      android-studio
    ];
  };
}
