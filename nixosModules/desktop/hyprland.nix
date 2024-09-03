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
    myNixOS.desktop.enable = true;
  };
}
