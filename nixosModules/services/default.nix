{ ... }:
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
    ./tuigreet-hyprland.nix
  ];
}
