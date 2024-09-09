{ ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages
    ];
  };
}
