{ config, lib, pkgs, ... }:
with lib; let
  cfg = config.services.printing;
in {
  meta = {};
  imports = [];

  options = {
    services.printing = {
      # already declared by nixos
    };
  };

  config = mkIf cfg.enable {

    # Scanning support
    hardware.sane.enable = true;
    hardware.sane.extraBackends = with pkgs; [
      # Add extra scanner drivers here.
      # See https://nixos.wiki/wiki/Scanners
    ];

    # Automatically discover network printers
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    services.printing = {
      drivers = with pkgs; [
        # Add more printer drivers here.
        # See https://nixos.wiki/wiki/Printing#Drivers
        gutenprint
      ];
    };
  };
}
