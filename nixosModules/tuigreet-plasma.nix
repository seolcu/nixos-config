{ pkgs, username, ... }:
{
  services.greetd = {
    enable = true;
    vt = 3; # Use tty7 for the greetd to get rid of the boot messages.
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd startplasma-wayland";
        user = username;
      };
    };
  };
}
