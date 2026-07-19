{ config, pkgs, ... }: {

  services.ollama = {
    enable = true;
    host = "127.0.0.1";
    port = 11434;
    package = pkgs.ollama-cuda;
  };

  environment.sessionVariables = {
    OLLAMA_API_BASE = "http://127.0.0.1:11434";
  };

  services.open-webui.enable = true;
}
