{ pkgs, ... }:
let
  sddm-astronaut = (pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
    themeConfig = {
      Background = "Backgrounds/beach.jpg";
    };
  }).overrideAttrs (oldAttrs: {
    installPhase = oldAttrs.installPhase + ''
      chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
      cp ${./wallpaper/beach.jpg} \
        $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/beach.jpg
    '';
  });
in
{
  meta = {};
  imports = [];
  options = {};

  config = {
    environment.systemPackages = [ sddm-astronaut ];

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      extraPackages = with pkgs; [
        kdePackages.qtmultimedia
      ];
      theme = "sddm-astronaut-theme";
    };
  };
}
