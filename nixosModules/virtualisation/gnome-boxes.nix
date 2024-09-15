{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    myNixOS.virtualisation.gnome-boxes.enable = lib.mkEnableOption "Enable gnome-boxes";
  };

  config = lib.mkIf config.myNixOS.virtualisation.gnome-boxes.enable {
    environment.systemPackages = with pkgs; [
      gnome-boxes
    ];
  };
}
