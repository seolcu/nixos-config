{ pkgs, username, ... }:
{
  services.greetd = {
    enable = true;
    vt = 7; # Use tty7 for the greetd to get rid of the boot messages.
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland";
        user = username;
      };
    };
  };
}
