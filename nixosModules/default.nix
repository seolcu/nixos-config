{ ... }:
{
  imports = [
    # Include the results of the hardware scan. `--impure` option is required.
    /etc/nixos/hardware-configuration.nix

    # Desktop
    # ./hyprland.nix
    ./plasma.nix
    # ./gnome.nix

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
    ./hostname.nix
    ./networkmanager.nix

    # i18n
    ./locale.nix

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
    ./stateVersion.nix
  ];
}
