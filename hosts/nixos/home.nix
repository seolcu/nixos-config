{ pkgs, username, ... }:

{
  imports = [
    # Desktop environment modules
    # ../../homeModules/hyprland.nix
    ../../homeModules/plasma.nix
    # ../../homeModules/gnome.nix

    ../../homeModules/virt-manager.nix
  ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = username;
    homeDirectory = "/home/${username}";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.05"; # Please read the comment before changing.

    # The packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      # # Adds the 'hello' command to your environment. It prints a friendly
      # # "Hello, world!" when run.
      # hello

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '') 

      # Development tools

      ## CLI tools

      gcc
      gdb
      python312
      python312Packages.ipykernel
      python312Packages.black
      openjdk
      nodejs
      hugo
      nixd
      nixfmt-rfc-style

      ## GUI tools

      vscode
      android-studio

      # Hacking tools

      ## CLI tools

      metasploit
      apktool
      dive
      steghide
      snow
      exiftool
      binwalk
      _7zz
      fcrackzip
      zsteg

      ## GUI tools

      ida-free
      ghidra
      okteta

      # Communication tools

      element-desktop
      discord
      zoom-us

      # Multimedia tools

      audacity
      vlc

      # Internet

      protonvpn-gui

      # Office

      obsidian

      # Etc.

      ## CLI

      mesa-demos
      unzip
      openssl
      file
      wget

      ## GUI

      bottles
      rpi-imager
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';

      ".config/libvirt/qemu.conf".text = ''
        # Adapted from /var/lib/libvirt/qemu.conf
        # Note that AAVMF and OVMF are for Aarch64 and x86 respectively
        nvram = [ "/run/libvirt/nix-ovmf/AAVMF_CODE.fd:/run/libvirt/nix-ovmf/AAVMF_VARS.fd", "/run/libvirt/nix-ovmf/OVMF_CODE.fd:/run/libvirt/nix-ovmf/OVMF_VARS.fd" ]
      '';
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/seolcu/etc/profile.d/hm-session-vars.sh
    #
    sessionVariables = {
      # EDITOR = "emacs";
    };
  };

  # Let Home Manager install and manage itself.
  # gtk = {
  #   enable = true;
  #   # iconTheme = {
  #   #   package = pkgs.papirus-icon-theme;
  #   #   name = "Papirus-Dark";
  #   # };
  # };
  # qt = {
  #   enable = true;
  #   # style = {
  #   #   package = pkgs.kdePackages.breeze;
  #   #   name = "breeze";
  #   # };
  # };

  programs = {
    home-manager.enable = true;
    htop.enable = true;
    btop.enable = true;
    bash = {
      enable = true;
      bashrcExtra = ''
        eval "$(starship init bash)"
      '';
    };
    fastfetch = {
      enable = true;
    };
    starship.enable = true;
    git = {
      enable = true;
      userEmail = "seolcu0112@proton.me";
      userName = "Gyuwon Seol";
      signing = {
        key = null;
        signByDefault = true;
      };
    };
    gh = {
      enable = true;
    };
    cava.enable = true;
    mangohud.enable = true;
    obs-studio.enable = true;
  };
}
