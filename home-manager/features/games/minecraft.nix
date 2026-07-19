{
  config,
  lib,
  pkgs,
  ...
}: with lib; let
  cfg = config.features.games.minecraft;
in {
  options.features.games.minecraft.enable = mkEnableOption "enable a minecraft launcher";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ prismlauncher ];
  };
}
