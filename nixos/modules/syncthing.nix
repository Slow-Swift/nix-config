{ config, lib, user, ... }:
with lib; let
  cfg = config.services.syncthing;
in {
  meta = {};
  imports = [];
  
  options = {
    services.syncthing = {
      # already declared by nixos
    };
  };

  config = mkIf cfg.enable {
    services.syncthing = {
      inherit user;

      enable = true;
      dataDir = "/home/${user}/";
      openDefaultPorts = true;
      group = "users";
    };
  }
}
