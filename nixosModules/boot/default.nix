{ lib, config, ... }:
{
  imports = [
    ./cachyos-kernel.nix
    ./kernel-config.nix
    ./plymouth.nix
    ./systemd-boot.nix
  ];

  myNixOS.boot = {
    cachyos-kernel.enable = lib.mkIf config.myNixOS.desktop.enable true;
    plymouth.enable = lib.mkIf config.myNixOS.desktop.enable true;
  };
}
