{ lib, config, ... }:
{
  imports = [
    ./firefox.nix
    ./gnupg.nix
    ./kdeconnect.nix
    ./steam.nix
  ];

  myNixOS.programs = {
    kdeconnect.enable = lib.mkIf (
      config.myNixOS.desktop.hyprland.enable || config.myNixOS.desktop.plasma.enable
    ) true;
  };
}
