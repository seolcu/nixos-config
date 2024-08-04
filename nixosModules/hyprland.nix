{ ... }:
{
  imports = [ ./tuigreet.nix ];
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
}
