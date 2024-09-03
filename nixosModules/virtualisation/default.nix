{ lib, ... }:
{
  imports = [
    ./distrobox.nix
    ./virt-manager.nix
    ./virtualbox.nix
    ./waydroid.nix
  ];

  myNixOS.virtualisation = {
    distrobox.enable = lib.mkDefault true;
    virt-manager.enable = lib.mkDefault true;
    virtualbox.enable = lib.mkDefault false;
    waydroid.enable = lib.mkDefault false;
  };
}
