{ lib, config, ... }:
{
  imports = [
    ./fcitx5.nix
    ./ibus.nix
    ./locale.nix
  ];

  myNixOS.i18n = {
    fcitx5.enable = lib.mkIf (
      config.myNixOS.desktop.hyprland.enable || config.myNixOS.desktop.plasma.enable
    ) true;
    ibus.enable = lib.mkIf (config.myNixOS.desktop.gnome.enable) true;
  };
}
