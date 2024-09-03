{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    myNixOS.boot.cachyos-kernel.enable = lib.mkEnableOption "Enable cachyos kernel";
  };

  config = lib.mkIf config.myNixOS.boot.cachyos-kernel.enable {
    boot.kernelPackages = pkgs.linuxPackages_cachyos;

    # Needed to use cachyos kernel
    chaotic.scx.enable = true; # by default uses scx_rustland scheduler
  };
}
