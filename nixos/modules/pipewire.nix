{ config, lib, pkgs, ... }: 
with lib; let
  cfg = config.services.pipewire;
in {
  meta = {};
  imports = [];

  options = {
    services.pipewire = { 
      # already declared by nixos 
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ alsa-utils ];

    services.pulseaudio.enable = false;

    services.pipewire = {
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    security.rtkit.enable = true;
  };
}
