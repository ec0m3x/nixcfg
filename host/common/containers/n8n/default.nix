{ self, config, pkgs, lib, ... }:

{
  age.secrets.n8n = {
    file = "${self}/secrets/n8n.age";
    mode = "600";
  };
  age.secrets.postgres = {
    file = "${self}/secrets/postgres.age";
    mode = "600";
  };
  # Containers
  virtualisation.oci-containers.containers."n8n" = {
    image = "n8nio/n8n:latest";
    environmentFiles = [
      config.age.secrets.n8n.path
    ];
    environment = {
      "DB_POSTGRESDB_HOST" = "postgres";
      "DB_TYPE" = "postgresdb";
      "N8N_DIAGNOSTICS_ENABLED" = "false";
      "N8N_PERSONALIZATION_ENABLED" = "false";
    };
    volumes = [
      "n8n_data:/backup:rw"
      "n8n_data:/data/shared:rw"
    ];
    ports = [
      "5678:5678/tcp"
    ];
    extraOptions = ["--network=localAI"];
  };

  virtualisation.oci-containers.containers."postgres" = {
    image = "postgres:16-alpine";
    environmentFiles = [
      config.age.secrets.postgres.path
    ];
    environment = {
      "POSTGRES_DB" = "n8n";
    };
    volumes = [
      "postgres_data:/var/lib/postgresql/data:rw"
    ];
    extraOptions = ["--network=localAI"];
  };

  virtualisation.oci-containers.containers."qdrant" = {
    image = "qdrant/qdrant";
    volumes = [
      "qdrant_data:/qdrant/storage:rw"
    ];
    ports = [
      "6333:6333/tcp"
    ];
    extraOptions = ["--network=localAI"];
  };
}
