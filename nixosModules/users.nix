{ username, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${username}" = {
    isNormalUser = true;
    description = "Gyuwon Seol";
    extraGroups = [
      "wheel"
    ];
    # packages = with pkgs; [ ];
  };
}
