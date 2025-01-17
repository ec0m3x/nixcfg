{ self, config, pkgs, lib, username, ... }:

{
  # Secrets
  age.secrets.postgres = {
    file = "${self}/secrets/postgres.age";
    mode = "600";
  };

  age.secrets.qdrant = {
    file = "${self}/secrets/qdrant.age";
    mode = "600";
  };
  # Network
  system.activationScripts.createDockerNetworkN8n = lib.mkAfter ''
    if ! /run/current-system/sw/bin/docker network inspect n8n >/dev/null 2>&1; then
      /run/current-system/sw/bin/docker network create n8n
    fi
  '';

  # Containers
  virtualisation.oci-containers.containers."n8n" = {
    image = "n8nio/n8n:next";
    environment = {
      "GENERIC_TIMEZONE" = "Europe/Berlin";
      "TZ" = "Europe/Berlin";
      "WEBHOOK_URL" = "https://n8n-hl.sks-concept.de";
    };
    volumes = [
      "n8n_data:/home/node/.n8n"
    ];
    ports = [
      "5678:5678/tcp"
    ];
    extraOptions = [
      "--network=n8n"
      "--add-host=host.docker.internal:host-gateway"
    ];
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
      "/home/${username}/containers/postgres/postgres_data:/var/lib/postgresql/data:rw"
    ];
    extraOptions = [
      "--network=n8n"
    ];
  };

  virtualisation.oci-containers.containers."qdrant" = {
    image = "qdrant/qdrant";
    environmentFiles = [
      config.age.secrets.qdrant.path
    ];
    volumes = [
      "/home/${username}/containers/qdrant/qdrant_data:/qdrant/storage:rw"
    ];
    ports = [
      "6333:6333/tcp"
    ];
    extraOptions = [
      "--network=n8n"
    ];
  };
}
