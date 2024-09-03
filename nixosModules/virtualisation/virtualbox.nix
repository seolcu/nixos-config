{
  lib,
  config,
  username,
  ...
}:
{
  options = {
    myNixOS.virtualisation.virtualbox.enable = lib.mkEnableOption "Enable VirtualBox";
  };

  config = lib.mkIf config.myNixOS.virtualisation.virtualbox.enable {
    virtualisation.virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
      };
      guest = {
        enable = true;
        dragAndDrop = true;
      };
    };

    users.users."${username}".extraGroups = [
      "vboxusers"
    ];
  };
}
