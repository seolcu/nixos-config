{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.kcalc
    kdePackages.ktorrent
    kleopatra
    libreoffice-qt6
  ];
}
