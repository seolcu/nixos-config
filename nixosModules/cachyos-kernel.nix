{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  # Needed to use cachyos kernel
  chaotic.scx.enable = true; # by default uses scx_rustland scheduler
}
