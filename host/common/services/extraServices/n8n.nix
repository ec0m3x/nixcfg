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
      n8n = {
        enable = true;
        openFirewall = true;
      };
      qdrant = {
        enable = true;
      };
    };
  };
}