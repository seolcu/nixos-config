{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    myNixOS.programs.stylix.enable = lib.mkEnableOption "Enable Stylix";
  };

  config = lib.mkIf config.myNixOS.programs.stylix.enable {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
      image = ../wallpapers/gruvbox_astro.jpg;
      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
      };
      fonts.sizes = {
        applications = 11;
        desktop = 11;
        popups = 11;
        terminal = 11;
      };
      fonts = {
        monospace = {
          package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
          name = "JetBrainsMono Nerd Font";
        };
        sansSerif = {
          package = pkgs.noto-fonts;
          name = "Noto Sans";
        };
        serif = {
          package = pkgs.noto-fonts;
          name = "Noto Serif";
        };
        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
      };
    };
    myNixOS.boot.plymouth.enable = lib.mkDefault true;
  };
}
