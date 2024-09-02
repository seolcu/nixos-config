{
  inputs,
  username,
  host,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit username;
      inherit host;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    # backupFileExtension = "backup";
    users.${username} = import ../hosts/${host}/home.nix;
  };
}
