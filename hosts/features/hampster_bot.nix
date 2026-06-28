{ ... }:
{
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0666"
    SUBSYSTEM=="tty", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0666", SYMLINK+="ttyUSB_BETAFLIGHT"
    KERNEL=="js*", MODE="0666"
    KERNEL=="hidraw*", MODE="0666"
    KERNEL=="ttyUSB[0-9]*", MODE="0666"
  '';
}
