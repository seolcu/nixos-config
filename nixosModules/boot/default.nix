{ ... }:
{
  imports = [
    ./cachyos-kernel.nix
    ./kernel-config.nix
    ./plymouth.nix
    ./systemd-boot.nix
  ];
}
