# nixos-config

A personal NixOS configuration flake.

## prerequisites

- [NixOS](https://nixos.org/download.html) installed
- [Nix Flakes](https://nixos.wiki/wiki/Flakes) enabled

## installation

```sh
nix-shell -p git --run "git clone https://github.com/seolcu/nixos-config ~/nixos-config"
sudo nixos-rebuild switch --flake ~/nixos-config --impure
```
