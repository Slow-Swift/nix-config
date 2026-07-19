{
  config,
  lib,
  pkgs,
  ...
}: with lib; let
  cfg = config.features.programming.gamedev.godot;
in {
  options.features.programming.gamedev.godot.enable = mkEnableOption "enable godot";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      godot
      godot-mono
      blender
    ];
  };
}
