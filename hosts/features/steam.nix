{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    protontricks.enable = true;
  };

  environment.systemPackages = with pkgs; [
    lutris
  ];

  hardware.steam-hardware.enable = true;
}
