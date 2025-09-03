{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.zen-browser.homeModules.twilight ];

  home.username = lib.mkDefault "finian";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  home.packages = with pkgs; [
    discord
  ];
  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;

  programs.zen-browser.enable = true;

  home.stateVersion = "25.05";
}
