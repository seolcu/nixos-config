{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    myNixOS.desktop.gnome.enable = lib.mkEnableOption "Enable GNOME Desktop Environment";
  };

  config = lib.mkIf config.myNixOS.desktop.gnome.enable {
    # Enable the X11 windowing system.
    services.xserver = {
      enable = true;
      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    environment.gnome.excludePackages = [
      pkgs.epiphany
      pkgs.geary
    ];
    myNixOS.desktop.enable = true;
  };
}
