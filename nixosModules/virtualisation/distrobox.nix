{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    myNixOS.virtualisation.distrobox.enable = lib.mkEnableOption "Enable distrobox";
  };

  config = lib.mkIf config.myNixOS.virtualisation.distrobox.enable {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };

    environment.systemPackages = [ pkgs.distrobox ];
  };
}
