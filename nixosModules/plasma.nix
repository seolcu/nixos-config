{ ... }:
{
  imports = [
    # ./tuigreet-plasma.nix
    ./fcitx5.nix
  ];
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
  };
  stylix.fonts.sizes = {
    applications = 10;
    desktop = 10;
    popups = 10;
    terminal = 10;
  };
}
