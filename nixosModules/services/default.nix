{ lib, config, ... }:
{
  imports = [
    ./avahi.nix
    ./bluetooth.nix
    ./cups.nix
    ./flatpak.nix
    ./keymap.nix
    ./libinput.nix
    ./pipewire.nix
    ./power-profiles-daemon.nix
    ./sshd.nix
  ];

  myNixOS.services = {
    bluetooth.enable = lib.mkIf config.myNixOS.desktop.enable true;
    cups.enable = lib.mkIf config.myNixOS.desktop.enable true;
    flatpak.enable = lib.mkIf config.myNixOS.desktop.enable true;
    libinput.enable = lib.mkIf config.myNixOS.desktop.enable true;
    pipewire.enable = lib.mkIf config.myNixOS.desktop.enable true;
    power-profiles-daemon.enable = lib.mkIf config.myNixOS.desktop.enable true;
  };
}
