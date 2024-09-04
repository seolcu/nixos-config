{ lib, config, ... }:
{
  options = {
    myNixOS.desktop.hyprland.enable = lib.mkEnableOption "Enable Hyprland desktop";
  };

  config = lib.mkIf config.myNixOS.desktop.hyprland.enable {
    services = {
      blueman.enable = true;
      logind.extraConfig = ''
        # don’t shutdown when power button is short-pressed
        HandlePowerKey=ignore
      '';
    };
    programs = {
      nm-applet.enable = true;
    };

    myNixOS = {
      i18n.fcitx5.enable = lib.mkDefault true;
      programs = {
        kdeconnect.enable = lib.mkDefault true;
        stylix.enable = lib.mkDefault true;
      };
      services.tuigreet-hyprland.enable = lib.mkDefault true;
    };
  };
}
