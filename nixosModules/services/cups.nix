{ lib, config, ... }:
{
  options = {
    myNixOS.services.cups.enable = lib.mkEnableOption "Enable CUPS to print documents";
  };

  config = lib.mkIf config.myNixOS.services.cups.enable {
    # Enable CUPS to print documents.
    services.printing.enable = true;
  };
}
