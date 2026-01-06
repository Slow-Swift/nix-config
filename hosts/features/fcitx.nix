{ pkgs, ... }:
{
  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    GLFW_IM_MODULE = "ibus"; # for some Wayland apps (optional)
  };

  # Select internationalisation properties.
  i18n.inputMethod = {
      type = "fcitx5";
      enable = true;

      fcitx5 = {
          waylandFrontend = true;
	  ignoreUserConfig = true;
          addons = with pkgs; [
            fcitx5-mozc
          ];
          settings = {
            inputMethod = {
              "Groups/0" = {
                Name = "Default";
                "Default Layout" = "us";
                "DefaultIM" = "keyboard-us";
              };
              "Groups/0/Items/0".Name = "keyboard-us";
              "Groups/0/Items/1".Name = "mozc";
	      "Groups/0/Items/2".Name = "keyboard-gr-polytonic";
            };
          };
        };
    };
}
