{ lib, ... }:
{
  imports = [
    ./cachyos-kernel.nix
    ./plymouth.nix
    ./systemd-boot.nix
  ];

  myNixOS.boot = {
    cachyos-kernel.enable = lib.mkDefault false;
  };
}
