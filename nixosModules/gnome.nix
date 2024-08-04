{ pkgs, ... }:
{
  imports = [ ./fcitx5.nix ];
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  environment.gnome.excludePackages = [ pkgs.epiphany ];
  stylix.fonts.sizes = {
    applications = 11;
    desktop = 11;
    popups = 11;
    terminal = 10;
  };
}
