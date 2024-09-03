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
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
