{ lib, ... }:
{
  imports = [
    ./hyprland.nix
    ./plasma.nix
    ./gnome.nix
  ];

  options = {
    # automatically enabled if any desktop is enabled
    myNixOS.desktop.enable = lib.mkEnableOption "Enable desktop environment";
  };
}
