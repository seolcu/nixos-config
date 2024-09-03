{ lib, config, ... }:
{
  options = {
    myNixOS.programs.steam.enable = lib.mkEnableOption "Enable Steam";
  };

  config = lib.mkIf config.myNixOS.programs.steam.enable {
    programs = {
      steam = {
        enable = true;
        gamescopeSession.enable = true;
      };
      gamemode.enable = true;
    };
  };
}
