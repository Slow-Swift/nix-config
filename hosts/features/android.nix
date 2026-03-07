 {pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    maven
    android-studio
    android-tools
  ];
}
