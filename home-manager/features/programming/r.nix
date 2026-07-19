{
  config,
  lib,
  pkgs,
  ...
}: with lib; let 
  cfg = config.features.programming.r;
in {
  options.features.programming.r.enable = mkEnableOption "enable r language support";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      rWrapper
      rstudioWrapper
    ];
  };
}
