{ lib, pkgs, ... }:
{
  meta = {};
  imports = {};
  options = {};

  config.fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      alegreya
      iosevka
      liberation_ttf
      mplus-outline-fonts.githubRelease
      nerd-fonts.droid-sans-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.space-mono
      nerd-fonts.fira-code
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      source-code-pro
      weather-icons
    ];

    fontconfig = {
      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["JetBrainsMono Nerd Font"];
      };
    };
  };
}
