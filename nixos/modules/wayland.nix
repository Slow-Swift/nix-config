{ config, pkgs, ... }: {
  
  environment.sessionVariables = {
    # Tell Firefox to use Wayland
    MOZ_ENABLE_WAYLAND = "1";

    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    wayland-utils
    xclip
    wl-clipboard
  ];

  # Enable some X compatibility layers. 
  programs.xwayland.enable = true;
  services.xserver.enable = true;

}
