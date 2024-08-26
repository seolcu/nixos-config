{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.kcalc
    kdePackages.ktorrent
    kdePackages.discover
    kdePackages.krdc
    kleopatra
    libreoffice-qt6
  ];
}
