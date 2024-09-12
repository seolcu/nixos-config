{ lib, config, ... }:
{
  options = {
    myHome.presets.desktop.enable = lib.mkEnableOption "Enable desktop presets";
  };

  config = lib.mkIf config.myHome.presets.desktop.enable {
    myHome = {
      programs = {
        android-studio.enable = lib.mkDefault false;
        ghidra.enable = lib.mkDefault false;
        ida-free.enable = lib.mkDefault true;
      };
      virtualisation = {
        quickemu.enable = lib.mkDefault false;
        virt-manager.enable = lib.mkDefault true;
      };
    };
  };
}
