{ ... }:
{
  # Shell aliases
  environment.interactiveShellInit = ''
    alias up='sudo nixos-rebuild switch --flake ~/nixos-config --upgrade; flatpak update'
    alias sictools='java -jar ~/문서/코드/SicTools/out/make/sictools.jar'
  '';
}
