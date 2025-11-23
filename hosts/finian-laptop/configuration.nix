# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ../nixosModules/common
    
      ./hardware-configuration.nix
      ../features/plasma.nix
      ../features/fcitx.nix
      ../features/hampster_bot.nix
      ../features/android.nix
      ../features/steam.nix
    ];

  networking.hostName = "finian-laptop"; # Define your hostname.
  
  # Set your time zone.
  time.timeZone = "America/Vancouver";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.finian = {
    isNormalUser = true;
    description = "Finian";
    extraGroups = [ "networkmanager" "wheel" "kvm" "adbusers"];
    packages = with pkgs; [];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     neovim
     git
     jdk
     gcc
     unzip
     python3
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
