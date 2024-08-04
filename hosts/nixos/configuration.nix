# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
  };

  hardware = {
    bluetooth = {
      enable = true; # enables support for Bluetooth
      powerOnBoot = true; # powers up the default Bluetooth controller on boot
    };
    # Enable sound with pipewire.
    pulseaudio.enable = false;
  };

  services = {
    blueman.enable = true;
    logind.extraConfig = ''
      # don’t shutdown when power button is short-pressed
      HandlePowerKey=ignore
    '';
    greetd = {
      enable = true;
      vt = 7; # Use tty7 for the greetd to get rid of the boot messages.
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland";
          user = "seolcu";
        };
      };
    };
    power-profiles-daemon.enable = true;
    # Configure keymap in X11
    xserver = {
      xkb = {
        layout = "kr";
        variant = "kr104";
      };
      # Enable touchpad support (enabled default in most desktopManager).
      # libinput.enable = true;
    };
    # Enable CUPS to print documents.
    printing.enable = true;
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
  };

  networking = {
    hostName = "nixos";
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
    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5.addons = with pkgs; [ fcitx5-hangul ];
    };
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    inter
    font-awesome
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  programs = {
    hyprland.enable = true;
    firefox.enable = true;
    nm-applet.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
    virt-manager.enable = true;
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # mtr.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };

  # Optional, hint electron apps to use wayland:
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.seolcu = {
    isNormalUser = true;
    description = "seolcu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
    # packages = with pkgs; [ ];
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = ../../wallpapers/gruvbox_astro.jpg;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font";
      };
      # List services that you want to enable:
      serif = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  virtualisation.libvirtd.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
