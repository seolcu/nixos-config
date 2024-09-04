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
      preset =
        { username, hostname }:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit hostname;
          };
          modules = [
            ./hosts/${hostname}/configuration.nix
            ./nixosModules
            inputs.chaotic.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs;
                  inherit username;
                  inherit hostname;
                };
                useGlobalPkgs = true;
                useUserPackages = true;
                # backupFileExtension = "backup";
                users.${username} = {
                  imports = [
                    ./hosts/${hostname}/home.nix
                    ./homeModules
                  ];
                };
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        T16G1 = preset {
          username = "seolcu";
          hostname = "T16G1";
        };
        T480s = preset {
          username = "seolcu";
          hostname = "T480s";
        };
      };
    };
}
