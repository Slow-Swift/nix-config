{
  config,
  lib,
  pkgs,
  ...
}: with lib; let
  cfg = config.features.games.archipelago;
in {
  options.features.games.archipelago.enable = mkEnableOption "enable archipelago";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ archipelago ];
  };
}
