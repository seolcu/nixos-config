{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.kcalc
    kdePackages.ktorrent
    kdePackages.discover
    kleopatra
    libreoffice-qt6
  ];
}
