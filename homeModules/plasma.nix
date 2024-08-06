{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.kcalc
    kdePackages.ktorrent
  ];
}
