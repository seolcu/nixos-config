{ ... }:
{
  imports = [ ./tuigreet-plasma.nix ];
  services = {
    desktopManager.plasma6.enable = true;
  };
}
