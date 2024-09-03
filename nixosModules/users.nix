{ username, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${username}" = {
    isNormalUser = true;
    description = "Gyuwon Seol";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "vboxusers"
    ];
    # packages = with pkgs; [ ];
  };
}
