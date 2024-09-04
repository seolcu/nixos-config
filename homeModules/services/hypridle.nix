{ lib, config, ... }:
{
  options = {
    myHome.services.hypridle.enable = lib.mkEnableOption "Enable Hypridle";
  };

  config = lib.mkIf config.myHome.services.hypridle.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof swaylock || swaylock";
          ignore_dbus_inhibit = false;
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };
        listener = [
          {
            timeout = 300;
            on-timeout = "hyprctl dispatch dpms off; pidof swaylock || swaylock";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            timeout = 600;
            on-timeout = "systemctl suspend; pidof swaylock || swaylock";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
