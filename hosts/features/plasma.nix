{ pkgs, ... }:
{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.discover
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kclock
    kdePackages.kcolorchooser
    kdePackages.ksystemlog
    kdePackages.sddm-kcm
    kdiff3
    kdePackages.partitionmanager
    hardinfo2
    vlc
    wayland-utils
    xclip
    wl-clipboard
    libsForQt5.qtstyleplugin-kvantum
  ];
}
