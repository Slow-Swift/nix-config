# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, user, ... }:

{
  imports = [
    ./gpu.nix
    ../../modules/ai.nix
    ../../modules/android.nix
    ../../modules/bluetooth.nix
    ../../modules/fcitx.nix
    ../../modules/fonts.nix
    ../../modules/localsend.nix
    ../../modules/nvim.nix
    ../../modules/pipewire.nix
    ../../modules/plasma.nix
    ../../modules/printing.nix
    ../../modules/sddm
    ../../modules/steam.nix
    ../../modules/syncthing.nix
    ../../modules/tailscale.nix
    ../../modules/wayland.nix
  ];

  # Boot Definition
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelParams = [ ];
  
  # Swap
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16*1024; # 16 GB
  }]; 

  environment.homeBinInPath = true;
  environment.systemPackages = import ./system-packages.nix { inherit config pkgs; };
  nixpkgs.config.allowUnfree = true;

  # Networking
  networking = {
    hostName = "finian-laptop";
    networkmanager.enable = true;
    networkmanager.dns = "systemd-resolved";
    nameservers = [
      "192.168.2.226"
      "1.1.1.1"
      "8.8.8.8"
      "9.9.9.9"
    ];
  };

  networking.nftables.enable = true;
  services.resolved.enable = true;

  # Shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Localization
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "America/Vancouver";

  hardware.bluetooth.enable = true;
  services.printing.enable = true;
  services.devmon.enable = true;
  services.pipewire.enable = true;
  services.flatpak.enable = true;
  virtualisation.docker.enable = true;

  programs.nix-ld.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "dialout" "wheel" "kvm" "adbusers" "docker" "input" "disk" "cdrom" ];
    packages = with pkgs; [];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the commentt?
}
