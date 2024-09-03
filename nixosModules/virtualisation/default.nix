{ lib, config, ... }:
{
  imports = [
    ./distrobox.nix
    ./virt-manager.nix
    ./virtualbox.nix
    ./waydroid.nix
  ];

  myNixOS.virtualisation = {
    distrobox.enable = lib.mkIf config.myNixOS.desktop.enable true;
    virt-manager.enable = lib.mkIf config.myNixOS.desktop.enable true;
    virtualbox.enable = lib.mkDefault false;
    waydroid.enable = lib.mkDefault false;
  };
}
