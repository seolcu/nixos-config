{ ... }:
{
  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "kr";
      variant = "kr104";
    };
  };
}
