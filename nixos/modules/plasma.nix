{ pkgs, ... }: {
  services = {
    desktopManager.plasma6.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kclock
    kdePackages.kcolorchooser
    kdePackages.ksystemlog
    kdePackages.sddm-kcm
    kdePackages.qtmultimedia
    kdePackages.isoimagewriter
    kdePackages.partitionmanager
    libsForQt5.qtstyleplugin-kvantum
  ];
}
