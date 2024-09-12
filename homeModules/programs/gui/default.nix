{ pkgs, ... }:
{
  imports = [
    ./android-studio.nix
    ./ghidra.nix
    ./ida-free.nix
    ./imv.nix
    ./kitty.nix
    ./mangohud.nix
    ./mpv.nix
    ./obs-studio.nix
    ./rofi-wayland.nix
    ./swaylock.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    # Development
    vscode

    # Hacking
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
  ];
}
