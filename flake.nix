{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      host = "nixos";
      username = "seolcu";
    in
    {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
            inherit host;
          };
          modules = [
            ./hosts/${host}/configuration.nix
            inputs.chaotic.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
          ];
        };
      };
    };
}
