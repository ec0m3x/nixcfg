{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.n8n;
in {
  options.extraServices.n8n.enable = mkEnableOption "enable n8n";

  config = mkIf cfg.enable {
    services = {
      ollama = {
        enable = true;
      };
      n8n = {
        enable = true;
        openFirewall = true;
        settings = {
          N8N_EDITOR_BASE_URL = "https://n8n.sks-concept.de";
          WEBHOOK_URL = "https://n8n.sks-concept.de";
        };
      };
      qdrant = {
        enable = true;
      };
    };
  };
}