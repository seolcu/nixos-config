{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    myHome.programs.ghidra.enable = lib.mkEnableOption "Enable Ghidra";
  };

  config = lib.mkIf config.myHome.programs.ghidra.enable {
    home.packages = with pkgs; [
      ghidra
    ];
  };
}
