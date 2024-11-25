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
        webhookUrl = "https://n1x-cs-1.taile8253.ts.net";
      };
      qdrant = {
        enable = true;
      };
    };
  };
}