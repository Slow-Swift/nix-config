{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    protontricks.enable = true;
  };

  environment.systemPackages = with pkgs; [
    lutris
  ];

  # Enable some controller support
  hardware.steam-hardware.enable = true;
  hardware.xone.enable = true;
}
