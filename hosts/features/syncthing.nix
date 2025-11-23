{ ... }:
{
  services.syncthing = {
    enable = true;
    dataDir = "/home/finian/";
    openDefaultPorts = true;
    user = "finian";
    group = "users";
  };
}