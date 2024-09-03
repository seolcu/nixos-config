{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    myNixOS.i18n.fcitx5.enable = lib.mkEnableOption "Enable fcitx5";
  };

  config = lib.mkIf config.myNixOS.i18n.fcitx5.enable {
    i18n = {
      inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5.addons = with pkgs; [ fcitx5-hangul ];
      };
    };
  };
}
