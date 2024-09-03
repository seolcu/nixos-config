{ lib, config, ... }:
{
  options = {
    myNixOS.boot.plymouth.enable = lib.mkEnableOption "Enable Plymouth";
  };

  config = lib.mkIf config.myNixOS.boot.plymouth.enable {
    boot.plymouth.enable = true;
  };
}
