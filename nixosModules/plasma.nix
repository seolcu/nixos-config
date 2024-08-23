{ ... }:
{
  imports = [
    # ./tuigreet-plasma.nix
    ./fcitx5.nix
    ./kdeconnect.nix
  ];
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
  };
}
