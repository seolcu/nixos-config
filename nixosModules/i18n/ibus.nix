{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    myNixOS.i18n.ibus.enable = lib.mkEnableOption "Enable ibus";
  };

  config = lib.mkIf config.myNixOS.i18n.ibus.enable {
    i18n = {
      inputMethod = {
        type = "ibus";
        enable = true;
        ibus.engines = with pkgs.ibus-engines; [ hangul ];
      };
    };
  };
}
