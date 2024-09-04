{ pkgs, ... }:
{
  imports = [
    ./communication.nix
    ./hacking.nix
    ./imv.nix
    ./kitty.nix
    ./mangohud.nix
    ./mpv.nix
    ./obs-studio.nix
    ./protonvpn-gui.nix
    ./rofi-wayland.nix
    ./swaylock.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    # Development
    vscode
    android-studio

    # Hacking
    ida-free
    ghidra
    okteta

    # Communication
    element-desktop
    discord
    zoom-us

    # Internet
    protonvpn-gui

    # Etc
    obsidian
    bottles
    rpi-imager
    prismlauncher
    gnome-disk-utility
    quickemu
  ];
}
