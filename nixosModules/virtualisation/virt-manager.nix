{
  pkgs,
  lib,
  config,
  username,
  ...
}:
{
  options = {
    myNixOS.virtualisation.virt-manager.enable = lib.mkEnableOption "Enable virt-manager";
  };

  config = lib.mkIf config.myNixOS.virtualisation.virt-manager.enable {
    programs.virt-manager.enable = true;
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };

    # For nested virtualization
    boot.extraModprobeConfig = "options kvm_intel nested=1";

    users.users."${username}".extraGroups = [
      "libvirtd"
    ];
  };
}
