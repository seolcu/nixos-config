{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    myHome.programs.ida-free.enable = lib.mkEnableOption "Enable ida-free";
  };

  config = lib.mkIf config.myHome.programs.ida-free.enable {
    home.packages = with pkgs; [
      ida-free
    ];
  };
}
