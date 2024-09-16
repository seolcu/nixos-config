{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    myNixOS.desktop.plasma.enable = lib.mkEnableOption "Enable Plasma 6";
  };

  config = lib.mkIf config.myNixOS.desktop.plasma.enable {
    services = {
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
      desktopManager.plasma6.enable = true;
    };
    environment.systemPackages = with pkgs; [
      kdePackages.kcalc
      kdePackages.ktorrent
      kdePackages.discover
      kdePackages.krdc
      kdePackages.kgpg
      libreoffice-qt
      calligra
      vlc
      filelight
    ];

    myNixOS = {
      i18n.fcitx5.enable = lib.mkDefault true;
      programs.kdeconnect.enable = lib.mkDefault true;
    };
  };
}
