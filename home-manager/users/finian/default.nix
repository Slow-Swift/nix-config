{ config, lib, pkgs, ... }: let 
  username = "finian";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium
    todonotes csquotes import xifthen pdfpages transparent ebgaramond fontaxes biblatex;
  });
in {
  imports = [
    ../../common 
    ../../features/cli
    ../../features/games
    ../../features/programming
    ../../features/desktop/kde.nix
    inputs.zen-browser.homeModules.twilight
  ];
  
  features = {
    cli = {
      fish.enable = true;
      fzf.enable = true;
    };

    games = {
      minecraft.enable = true;
      archipelago.enable = true;
    };

    programming = {
      r.enable = false;
      gamedev.godot.enable = true;
    };

  };

  fonts.fontconfig.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
  };

  programs.home-manager.enable = true;
  programs.zen-browser.enable = true;

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

  home = {
    inherit homeDirectory username;

    sessionPath = [
      "$HOME/.local/bin"
    ];

    stateVersion = "25.05";
  }
}
