{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];

  home.packages = with pkgs; [
    kde-rounded-corners
    tela-circle-icon-theme
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      
    };

    fonts = {
      fixedWidth = {
        family = "JetBrainsMono Nerd Font Mono";
        pointSize = 11;
      };
      general = {
        family = "Roboto";
        pointSize = 11;
      };
      menu = {
        family = "Roboto";
        pointSize = 11;
      };
      small = {
        family = "Roboto";
        pointSize = 8;
      };
      toolbar = {
        family = "Roboto";
        pointSize = 11;
      };
      windowTitle = {
        family = "Roboto";
        pointSize = 11;
      };
    };

    hotkeys.commands = {
      clear-notifications = {
        name = "Clear all KDE Plasma notifications";
        key = "Meta+Shift+Backspace";
        command = "clear-kde-notifications";
      };
      launch-alacritty = {
        name = "Launch Ghostty";
        key = "Meta+Shift+Return";
        command = "ghostty";
      };
      launch-brave = {
        name = "Launch Zen";
        key = "Meta+Shift+B";
        command = "zen";
      };
    };

    krunner.activateWhenTypingOnDesktop = false;

    kscreenlocker = {
      appearance.showMediaControls = false;
      # Set Wallpaper here
    };

    kwin = {
      effects = {
        blur.enable = true;
        cube.enable = true;
        desktopSwitching.animation = "off";
        dimAdminMode.enable = false;
        dimInactive.enable = false;
        fallApart.enable = false;
        fps.enable = false;
        minimization.animation = "off";
        shakeCursor.enable = false;
        slideBack.enable = false;
        snapHelper.enable = false;
        translucency.enable = false;
        windowOpenClose.animation = "off";
        wobblyWindows.enable = false;
      };

      virtualDesktops = {
        number = 5;
        rows = 1;
      };
    };

    #overrideConfig = true;

    # panels = [
    #   {
    #     alignment = "left";
    #     height = 30;
    #     lengthMode = "fit";
    #     location = "top";
    #     opacity = "translucent";
    #     widgets = [
    #       {
    #         name = "org.dhruv8sh.kara";
    #         config = {
    #           general = {
    #             animationDuration = 0;
    #             highlightType = 1;
    #             spacing = 3;
    #             type = 1;
    #           };
    #           type1 = {
    #             fixedLen = 3;
    #             labelSource = 0;
    #           };
    #         };
    #       }
    #     ];
    #   }
    #   {
    #     alignment = "center";
    #     height = 30;
    #     lengthMode = "fit";
    #     location = "top";
    #     opacity = "translucent";
    #     widgets = [
    #       {
    #         name = "org.kde.plasma.digitalclock";
    #         config = {
    #           Appearance = {
    #             autoFontAndSize = false;
    #             customDateFormat = "ddd MMM d";
    #             dateDisplayFormat = "BesideTime";
    #             dateFormat = "custom";
    #             fontSize = 11;
    #             fontStyleName = "Regular";
    #             fontWeight = 400;
    #             use24hFormat = 2;
    #           };
    #         };
    #       }
    #     ];
    #   }
    #   {
    #     alignment = "right";
    #     height = 30;
    #     lengthMode = "fit";
    #     location = "top";
    #     opacity = "translucent";
    #     widgets = [
    #       {
    #         systemTray = {
    #           icons.scaleToFit = true;
    #           items = {
    #             showAll = false;
    #             shown = [
    #               "org.kde.plasma.keyboardlayout"
    #               "org.kde.plasma.networkmanagement"
    #               "org.kde.plasma.volume"
    #               "org.kde.plasma.battery"
    #             ];
    #             hidden = [
    #               "org.kde.plasma.brightness"
    #               "org.kde.plasma.clipboard"
    #               "org.kde.plasma.devicenotifier"
    #               "org.kde.plasma.mediacontroller"
    #               "plasmashell_microphone"
    #               "xdg-desktop-portal-kde"
    #               "zoom"
    #             ];
    #             configs = {
    #               "org.kde.plasma.notifications".config = {
    #                 Shortcuts = {
    #                   global = "Meta+N";
    #                 };
    #               };
    #             };
    #           };
    #         };
    #       }
    #     ];
    #   }
    # ];

    # powerdevil = {
    #  AC = {
    #    autoSuspend.action
    #  }
    # }
  };
}
