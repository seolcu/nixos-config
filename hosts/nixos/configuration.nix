# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  host,
  username,
  pkgs,
  ...
}:
{
  imports = [
    # Desktop environment modules
    # ../../nixosModules/hyprland.nix
    ../../nixosModules/plasma.nix
    # ../../nixosModules/gnome.nix

    # Include the results of the hardware scan. `--impure` option is required.
    /etc/nixos/hardware-configuration.nix

    ../../nixosModules/home-manager.nix
    ../../nixosModules/fonts.nix
    ../../nixosModules/virt-manager.nix
    # ../../nixosModules/virtualbox.nix
    # ../../nixosModules/waydroid.nix
    ../../nixosModules/gnupg.nix
    ../../nixosModules/distrobox.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
    kernelPackages = pkgs.linuxPackages_cachyos;
  };

  # Needed to use cachyos kernel
  chaotic.scx.enable = true; # by default uses scx_rustland scheduler

  hardware = {
    bluetooth = {
      enable = true; # enables support for Bluetooth
      powerOnBoot = true; # powers up the default Bluetooth controller on boot
    };
    # Enable sound with pipewire.
    pulseaudio.enable = false;
  };

  services = {
    power-profiles-daemon.enable = true;
    # Configure keymap in X11
    xserver = {
      xkb = {
        layout = "kr";
        variant = "kr104";
      };
    };
    # Enable touchpad support (enabled default in most desktopManager).
    # libinput.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;

    # Avahi for mDNS support (network host discovery)
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
    # Enable the OpenSSH daemon.
    # openssh.enable = true;
    flatpak.enable = true;
  };

  networking = {
    hostName = host;
    networkmanager.enable = true;
    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    firewall.enable = false;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = "Asia/Seoul";

  i18n = {
    defaultLocale = "ko_KR.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ko_KR.UTF-8";
      LC_IDENTIFICATION = "ko_KR.UTF-8";
      LC_MEASUREMENT = "ko_KR.UTF-8";
      LC_MONETARY = "ko_KR.UTF-8";
      LC_NAME = "ko_KR.UTF-8";
      LC_NUMERIC = "ko_KR.UTF-8";
      LC_PAPER = "ko_KR.UTF-8";
      LC_TELEPHONE = "ko_KR.UTF-8";
      LC_TIME = "ko_KR.UTF-8";
    };
  };

  programs = {
    firefox.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # mtr.enable = true;
  };

  # Optional, hint electron apps to use wayland:
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${username}" = {
    isNormalUser = true;
    description = "Gyuwon Seol";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "vboxusers"
    ];
    # packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   #  wget
  # ];

  # Shell aliases
  environment.interactiveShellInit = ''
    alias up='sudo nixos-rebuild switch --flake ~/nixos-config --impure --upgrade'
  '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
