{
  pkgs,
  username,
  lib,
  config,
  ...
}:
{
  options = {
    myNixOS.tuigreet-hyprland.enable = lib.mkEnableOption "Enable tuigreet";
  };

  config = lib.mkIf config.myNixOS.tuigreet-hyprland.enable {
    services.greetd = {
      enable = true;
      vt = 3; # Use tty7 for the greetd to get rid of the boot messages.
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland";
          user = username;
        };
      };
    };
  };
}
