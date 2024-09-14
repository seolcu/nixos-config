{ ... }:
{
  myNixOS = {
    presets.desktop.enable = true;
    programs.steam.enable = false;
  };
}
