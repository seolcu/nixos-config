# nixos-config

My personal NixOS configuration flake.

## prerequisites

- [NixOS](https://nixos.org/download.html) installed

## installation

```sh
nix-shell -p git
git clone https://github.com/seolcu/nixos-config ~/nixos-config
sudo nixos-rebuild switch --flake ~/nixos-config --impure
```
