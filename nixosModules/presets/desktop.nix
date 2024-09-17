{ lib, config, ... }:
{
  options = {
    myNixOS.presets.desktop.enable = lib.mkEnableOption "Enable desktop presets";
  };

  config = lib.mkIf config.myNixOS.presets.desktop.enable {
    myNixOS = {
      boot = {
        cachyos-kernel.enable = lib.mkDefault true;
        plymouth.enable = lib.mkDefault true;
      };
      desktop = {
        gnome.enable = lib.mkDefault false;
        hyprland.enable = lib.mkDefault false;
        plasma.enable = lib.mkDefault true;
      };
      programs = {
        firefox.enable = lib.mkDefault true;
        steam.enable = lib.mkDefault true;
      };
      services = {
        bluetooth.enable = lib.mkDefault true;
        cups.enable = lib.mkDefault true;
        flatpak.enable = lib.mkDefault true;
        fwupd.enable = lib.mkDefault true;
        libinput.enable = lib.mkDefault true;
        pipewire.enable = lib.mkDefault true;
        power-profiles-daemon.enable = lib.mkDefault true;
      };
      virtualisation = {
        distrobox.enable = lib.mkDefault true;
        gnome-boxes.enable = lib.mkDefault false;
        virt-manager.enable = lib.mkDefault true;
        virtualbox.enable = lib.mkDefault false;
        vmware.enable = lib.mkDefault false;
        waydroid.enable = lib.mkDefault false;
      };
    };
  };
}
