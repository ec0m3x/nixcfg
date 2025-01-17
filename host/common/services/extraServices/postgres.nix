{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.postgres;
in {
  options.extraServices.postgres.enable = mkEnableOption "enable postgres";

  config = mkIf cfg.enable {
    services.postgresql = {
      enable = true;
      package = pkgs.postgresql_17;
      extensions = with pkgs.postgresql17Packages; [
        pgvector
      ];
      authentication = ''
        local all all trust
        host all all 127.0.0.1/8 trust
        host all all ::1/128 trust

        host all all 10.20.50.0/24 trust
      '';
      initialScript = pkgs.writeText "initialScript.sql" ''
        CREATE USER n8n WITH PASSWORD 'n8n';
        CREATE DATABASE n8n;
        GRANT ALL PRIVILEGES ON DATABASE n8n TO n8n;

      '';
    };
  };
}