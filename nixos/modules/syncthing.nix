{ config, lib, user, ... }:
with lib; let
  cfg = config.services.syncthing;
in {
  meta = {};
  imports = [];
  
  options = {
  };

  config = {
    services.syncthing = {
      inherit user;

      enable = true;
      dataDir = "/home/${user}/";
      openDefaultPorts = true;
      group = "users";
    };
  };
}
