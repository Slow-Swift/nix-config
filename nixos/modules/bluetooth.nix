{ config, lib, ... }:
with lib; let 
  cfg = config.hardware.bluetooth;
in {
  meta = {};
  imports = [];

  options = {
    hardware.bluetooth = {};
  };

  config = mkIf cfg.enable {
    hardware.bluetooth = {
      powerOnBoot = true;
      settings.General.Experimental = true;
    };

    services.blueman.enable = true;
  };
}
