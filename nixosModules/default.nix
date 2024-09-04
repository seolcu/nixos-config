{ ... }:
{
  imports = [
    # Include the results of the hardware scan. `--impure` option is required.
    /etc/nixos/hardware-configuration.nix

    # Boot
    ./boot

    # Desktop
    ./desktop

    # Environment
    ./environment

    # i18n
    ./i18n

    # Networking
    ./networking

    # Presets
    ./presets

    # Programs
    ./programs

    # Services
    ./services

    # Virtualisation
    ./virtualisation

    # Etc
    ./users.nix
    ./fonts.nix
    ./timezone.nix
    ./nix-config.nix
    ./stateVersion.nix
  ];
}
