{ ... }:
{
  # Shell aliases
  environment.interactiveShellInit = ''
    alias up='sudo nixos-rebuild switch --flake ~/nixos-config --upgrade'
  '';
}
