{ pkgs, ... }:
{
  imports = [
    ./gh.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    gcc
    gnumake
    hugo
    openjdk
    nixd
    nixfmt-rfc-style
    nodejs
    python312
    python312Packages.ipykernel
    python312Packages.black
  ];
}
