{ lib, config, ... }:
{
  imports = [
    ./firefox.nix
    ./gnupg.nix
    ./kdeconnect.nix
    ./steam.nix
  ];

  myNixOS.programs = {
    firefox.enable = lib.mkIf config.myNixOS.desktop.enable true;
    kdeconnect.enable = lib.mkIf (
      config.myNixOS.desktop.hyprland.enable || config.myNixOS.desktop.plasma.enable
    ) true;
    steam.enable = lib.mkIf config.myNixOS.desktop.enable true;
  };
}
