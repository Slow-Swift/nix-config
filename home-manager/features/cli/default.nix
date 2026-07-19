{
  pkgs,
  ...
}: {
  imports = [
    ./fish.nix
    ./fzf.nix
  ];

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    extraOptions = ["-l" "--icons" "--git" "-a"];
  };

  programs.bat = {
    enable = true;
  };

  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
  };

  home.packages = with pkgs; [
    coreutils
    pciutils
    lshw
    fd
    htop
    httpie
    jq
    procs
    ripgrep
    tldr
    zip
  ];
}
