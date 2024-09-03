{ lib, ... }:
{
  imports = [
    ./hyprland.nix
    ./plasma.nix
    ./gnome.nix
  ];

  myNixOS.desktop = {
    hyprland.enable = lib.mkDefault false;
    plasma.enable = lib.mkDefault false;
    gnome.enable = lib.mkDefault false;
  };
}
