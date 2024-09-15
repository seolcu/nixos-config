{ pkgs, ... }:
{
  imports = [
    ./development

    ./bash.nix
    ./btop.nix
    ./cava.nix
    ./fastfetch.nix
    ./htop.nix
    ./pwndbg.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    # Hacking
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

    # Etc
    unzip
    openssl
    file
    wget
    pciutils
  ];
}
