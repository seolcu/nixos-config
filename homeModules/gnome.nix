{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
    gnomeExtensions.caffeine
    gnomeExtensions.vitals
    gnomeExtensions.thinkpad-battery-threshold
    fragments
    libreoffice
  ];
}
