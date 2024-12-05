{ self, config, pkgs, lib, ... }:

{
  # Secrets
  age.secrets.postgres = {
    file = "${self}/secrets/postgres.age";
    mode = "600";
  };
  # Network
  system.activationScripts.createDockerNetworkN8n = lib.mkAfter ''
    if ! /run/current-system/sw/bin/docker network exists n8n; then
      /run/current-system/sw/bin/docker network create n8n
    fi
  '';

  # Containers
  virtualisation.oci-containers.containers."n8n" = {
    image = "n8nio/n8n:latest";
    volumes = [
      "n8n_data:/backup:rw"
      "n8n_data:/data/shared:rw"
    ];
    ports = [
      "5678:5678/tcp"
    ];
    extraOptions = ["--network=n8n"];
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
    extraOptions = ["--network=n8n"];
  };

  virtualisation.oci-containers.containers."qdrant" = {
    image = "qdrant/qdrant";
    volumes = [
      "qdrant_data:/qdrant/storage:rw"
    ];
    ports = [
      "6333:6333/tcp"
    ];
    extraOptions = ["--network=n8n"];
  };
}
