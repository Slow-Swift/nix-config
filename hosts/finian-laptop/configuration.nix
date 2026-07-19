# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ../nixosModules/common
      ../features/plasma.nix
      ../features/fcitx.nix
      ../features/hampster_bot.nix
      ../features/android.nix
      ../features/steam.nix
      ../features/syncthing.nix
      ../features/tailscale.nix
    ];

    services.flatpak.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 8000; to = 8010; }
    ];
  };
  networking.nftables.enable = true;

  hardware.xone.enable = true;

  virtualisation.docker.enable = true;

  networking.hostName = "finian-laptop"; # Define your hostname.
  
  # Set your time zone.
  time.timeZone = "America/Vancouver";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.finian = {
    isNormalUser = true;
    description = "Finian";
    extraGroups = [ "networkmanager" "wheel" "kvm" "adbusers" "docker" "input" ];
    packages = with pkgs; [];
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withPython3 =true;
  };

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  programs.hamster.enable = true;
  programs.gnome-disks.enable = true;

  services.ollama = {
    enable = true;
    host = "127.0.0.1";
    port = 11434;
    package = pkgs.ollama-cuda;
  };
  services.open-webui.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    unrar
    dig
    timetrap
    activitywatch
    droidcam
    testdisk
    dd_rescue
    ntfs3g
    gh
    lynx
    file
    sqlite
    aider-chat
    linuxConsoleTools
    stylua
    flightgear
    nodejs
    tree-sitter
    clang-tools
    wget
    rshell
    arduino-cli
    geogebra
    libarchive
    unityhub
    libdvdcss
    usbutils
     dpkg
     alvr
     git
     jdk
     gcc
     unzip
     (pkgs.python3.withPackages (ps: with ps; [ pynvim ]))
     p7zip
  ];

  environment.sessionVariables = {
    OLLAMA_API_BASE = "http://127.0.0.1:11434";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
