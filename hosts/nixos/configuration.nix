# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:
{
  imports = [
    # Include the results of the hardware scan. `--impure` option is required.
    /etc/nixos/hardware-configuration.nix

    # Desktop
    # ../../nixosModules/hyprland.nix
    ../../nixosModules/plasma.nix
    # ../../nixosModules/gnome.nix

    # Boot
    ../../nixosModules/cachyos-kernel.nix
    ../../nixosModules/systemd-boot.nix
    ../../nixosModules/plymouth.nix

    # Services
    ../../nixosModules/bluetooth.nix
    ../../nixosModules/avahi.nix
    ../../nixosModules/power-profiles-daemon.nix
    ../../nixosModules/pipewire.nix
    ../../nixosModules/cups.nix
    ../../nixosModules/keymap.nix
    ../../nixosModules/sshd.nix
    ../../nixosModules/flatpak.nix
    ../../nixosModules/libinput.nix

    # Networking
    ../../nixosModules/firewall.nix
    ../../nixosModules/hostname.nix
    ../../nixosModules/networkmanager.nix

    # i18n
    ../../nixosModules/locale.nix

    # Programs
    ../../nixosModules/gnupg.nix
    ../../nixosModules/firefox.nix
    ../../nixosModules/steam.nix

    # Virtualisation
    ../../nixosModules/virt-manager.nix
    # ../../nixosModules/virtualbox.nix
    # ../../nixosModules/waydroid.nix
    ../../nixosModules/distrobox.nix

    # Environment
    ../../nixosModules/interactiveShellInit.nix
    ../../nixosModules/sessionVariables.nix
    ../../nixosModules/systemPackages.nix

    # Etc
    ../../nixosModules/users.nix
    ../../nixosModules/fonts.nix
    ../../nixosModules/timezone.nix
    ../../nixosModules/nix-config.nix
    ../../nixosModules/stateVersion.nix
  ];
}
