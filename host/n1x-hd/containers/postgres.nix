{ self, config, username, ... }:{
  # Secrets
  age.secrets.postgres = {
    file = "${self}/secrets/postgres.age";
    mode = "600";
  };

  # Postgres container configuration
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
      "--network=dockernet"
    ];
  };
}