{ ... }:
{
  imports = [
    # Include the results of the hardware scan. `--impure` option is required.
    /etc/nixos/hardware-configuration.nix

    # Desktop
    ./desktop

    # Boot
    ./boot

    # Services
    ./services

    # Networking
    ./networking

    # i18n
    ./i18n

    # Programs
    ./programs

    # Virtualisation
    ./virtualisation

    # Environment
    ./environment

    # Etc
    ./users.nix
    ./fonts.nix
    ./timezone.nix
    ./nix-config.nix
    ./stylix.nix
    ./stateVersion.nix
  ];
}
