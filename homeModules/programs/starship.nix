{ ... }:
{
  programs = {
    starship.enable = true;
    bash.bashrcExtra = ''
      eval "$(starship init bash)"
    '';
  };
}
