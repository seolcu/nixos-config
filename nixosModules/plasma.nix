{ ... }:
{
  imports = [
    ./tuigreet-plasma.nix
    ./fcitx5.nix
  ];
  services = {
    desktopManager.plasma6.enable = true;
  };
}
