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
    environment.gnome.excludePackages = with pkgs; [
      epiphany
      geary
    ];

    myNixOS = {
      i18n.ibus.enable = lib.mkDefault true;
    };
  };
}
