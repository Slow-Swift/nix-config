{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium
    todonotes csquotes import xifthen pdfpages transparent ebgaramond fontaxes biblatex;
  });
in
{
  imports = [ inputs.zen-browser.homeModules.twilight ];

  home.username = lib.mkDefault "finian";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";
  fonts.fontconfig.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withPython3 =true;

    extraPython3Packages = ps: with ps; [
      pynvim
      setuptools
    ];
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
  };

  home.packages = with pkgs; [
    ffmpeg
    poppler
    resvg

    biber
    obs-studio
    gimp
    tex
    libresprite
    audacity
    openxr-loader
    dotnet-sdk_9
    anki
    zathura
    stellarium
    pstoedit
    zoom-us
    discord
    teams-for-linux
    zotero
    libreoffice-qt-fresh
    hunspell
    hunspellDicts.en_CA
    hunspellDicts.en_US
    poptracker
    nestopia-ue
    obsidian
    inkscape
    nerd-fonts.fira-code
    cm_unicode
    corefonts
    vscode.fhs
    logisim-evolution
    owmods-gui
    (pkgs.writeShellScriptBin "new-java-project" (builtins.readFile ../scripts/new-java-project.sh))
  ];
  home.file = {};

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.home-manager.enable = true;

  programs.zen-browser.enable = true;

  home.stateVersion = "25.05";
}
