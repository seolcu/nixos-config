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
}
