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
    teams-for-linux
    zotero
    libreoffice-qt-fresh
    hunspell
    hunspellDicts.en_CA
    poptracker
    nestopia-ue
    obsidian
    inkscape
  ];
  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;

  programs.zen-browser.enable = true;

  home.stateVersion = "25.05";
}
