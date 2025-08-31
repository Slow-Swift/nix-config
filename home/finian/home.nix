{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.username = lib.mkDefault "finian";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  home.packages = [];
  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
