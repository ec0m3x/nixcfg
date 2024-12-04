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
      "DB_POSTGRESDB_HOST" = "localhost";
      "DB_TYPE" = "postgresdb";
      "N8N_DIAGNOSTICS_ENABLED" = "false";
      "N8N_PERSONALIZATION_ENABLED" = "false";
    };
    volumes = [
      "/home/ecomex/containers/n8n/backup:/backup:rw"
      "/home/ecomex/containers/n8n/shared:/data/shared:rw"
    ];
    ports = [
      "5678:5678/tcp"
    ];
    extraOptions = ["--network=host"];
  };

  virtualisation.oci-containers.containers."n8n-postgres" = {
    image = "postgres:16-alpine";
    environmentFiles = [
      config.age.secrets.postgres.path
    ];
    environment = {
      "POSTGRES_DB" = "n8n";
    };
    volumes = [
      "/home/ecomex/containers/n8n/n8n_postgres_storage:/var/lib/postgresql/data:rw"
    ];
    extraOptions = ["--network=host"];
  };

  virtualisation.oci-containers.containers."qdrant" = {
    image = "qdrant/qdrant";
    volumes = [
      "/home/ecomex/containers/n8n/n8n_qdrant_storage:/qdrant/storage:rw"
    ];
    ports = [
      "6333:6333/tcp"
    ];
    extraOptions = ["--network=host"];
  };
}
