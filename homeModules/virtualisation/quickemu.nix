{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    myHome.virtualisation.quickemu.enable = lib.mkEnableOption "Enable quickemu";
  };

  config = lib.mkIf config.myHome.virtualisation.quickemu.enable {
    home.packages = with pkgs; [
      quickemu
    ];
  };
}
