{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.kcalc
    kdePackages.ktorrent
  ];
  programs.kitty.enable = true;
}
