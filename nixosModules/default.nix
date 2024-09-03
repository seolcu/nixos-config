{ lib, config, ... }:
{
  imports = [
    # Include the results of the hardware scan. `--impure` option is required.
    /etc/nixos/hardware-configuration.nix

    # Desktop
    ./desktop

    # Boot
    ./cachyos-kernel.nix
    ./systemd-boot.nix
    ./plymouth.nix

    # Services
    ./bluetooth.nix
    ./avahi.nix
    ./power-profiles-daemon.nix
    ./pipewire.nix
    ./cups.nix
    ./keymap.nix
    ./sshd.nix
    ./flatpak.nix
    ./libinput.nix

    # Networking
    ./firewall.nix
    ./networkmanager.nix

    # i18n
    ./i18n

    # Programs
    ./programs

    # Virtualisation
    ./virtualisation

    # Environment
    ./interactiveShellInit.nix
    ./sessionVariables.nix
    ./systemPackages.nix

    # Etc
    ./users.nix
    ./fonts.nix
    ./timezone.nix
    ./nix-config.nix
    ./stylix.nix
    ./tuigreet-hyprland.nix
    ./stateVersion.nix
  ];

  myNixOS = {
    tuigreet-hyprland.enable = lib.mkIf config.myNixOS.desktop.hyprland.enable true;
  };
}
