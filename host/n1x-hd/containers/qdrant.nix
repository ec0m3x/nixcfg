{ self, config, username, ... }:{

  age.secrets.qdrant = {
    file = "${self}/secrets/qdrant.age";
    mode = "600";
  };

  # Qdrant container configuration
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
      "--network=dockernet"
    ];
  };
}