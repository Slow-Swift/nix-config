{pkgs, ... }:
{
  meta = {};
  imports = {};
  options = {};

  config = {
    environment.systemPackages = with pkgs; [
      maven
      android-studio
      android-tools
    ];
  
    users.groups.adbusers = {};
    users.groups.plugdev = {};
  };
}
