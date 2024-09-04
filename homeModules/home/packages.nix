{ pkgs, ... }:
{
  # The packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
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
    python312Packages.pwntools
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
    pwndbg

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

    unzip
    openssl
    file
    wget
    pciutils
    quickemu

    ## GUI

    bottles
    rpi-imager
    prismlauncher
    gnome-disk-utility
  ];
}
