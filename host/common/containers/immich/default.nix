{ config, pkgs, ... }:

{

  virtualisation.oci-containers = {
    backend = "podman";
    containers = {
      immich-server = {
        image = "ghcr.io/immich-app/immich-server:release";
        autoStart = true;
        cmd = [ "start.sh" "immich" ];
        environment = {
          DB_HOSTNAME = "immich-postgres";
          DB_USERNAME = "postgres";
          DB_PASSWORD = "postgres";
          DB_DATABASE_NAME = "immich";
          REDIS_HOSTNAME = "immich-redis";
        };
        volumes = [
          "/home/ecomex/data/immich_photos:/usr/src/app/upload"
        ];
        extraOptions = [ "--network=immich-net" ];
      };

      immich-microservices = {
        image = "ghcr.io/immich-app/immich-server:release";
        autoStart = true;
        cmd = [ "start.sh" "microservices" ];
        environment = {
          DB_HOSTNAME = "immich-postgres";
          DB_USERNAME = "postgres";
          DB_PASSWORD = "postgres";
          DB_DATABASE_NAME = "immich";
          REDIS_HOSTNAME = "immich-redis";
        };
        volumes = [
          "/home/ecomex/data/immich_photos:/usr/src/app/upload"
        ];
        extraOptions = [ "--network=immich-net" ];
      };

      immich-machine-learning = {
        image = "ghcr.io/immich-app/immich-machine-learning:release";
        autoStart = true;
        extraOptions = [ "--network=immich-net" ];
      };

      immich-postgres = {
        image = "tensorchord/pgvecto-rs:pg14-v0.2.0";
        autoStart = true;
        environment = {
          POSTGRES_USER = "postgres";
          POSTGRES_PASSWORD = "postgres";
          POSTGRES_DB = "immich";
        };
        volumes = [
          "/home/ecomex/data/immich_pgdata:/var/lib/postgresql/data"
        ];
        extraOptions = [ "--network=immich-net" ];
      };

      immich-redis = {
        image = "redis:6.2-alpine";
        autoStart = true;
        extraOptions = [ "--network=immich-net" ];
      };
    };
  };

  # Create the Immich network
  systemd.services.create-immich-network = {
    description = "Create Immich Podman network";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "oneshot";
    script = ''
      ${pkgs.podman}/bin/podman network exists immich-net || ${pkgs.podman}/bin/podman network create immich-net
    '';
  };
}
