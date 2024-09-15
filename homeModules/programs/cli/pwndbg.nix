{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pwndbg
    (writeShellScriptBin "gdb" ''
      exec pwndbg "$@"
    '')
  ];
}
