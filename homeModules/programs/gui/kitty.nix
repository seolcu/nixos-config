{ lib, config, ... }:
{
  options = {
    myHome.programs.kitty.enable = lib.mkEnableOption "Enable kitty";
  };

  config = lib.mkIf config.myHome.programs.kitty.enable {
    programs = {
      kitty.enable = true;
      bash.enableVteIntegration = true;
    };
  };
}
