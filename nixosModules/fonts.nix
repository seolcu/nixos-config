{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ubuntu_font_family
    inter
    font-awesome
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
