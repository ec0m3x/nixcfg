{ lib, username, ... }:{

  # Create directories and run scripts for the containers
  system.activationScripts = {
      script.text = ''
          install -d -m 755 /home/ecomex/containers/baserow/baserow_data -o root -g root
      '';
  };

  # Container configuration for Baserow
  virtualisation.oci-containers.containers."baserow" = {
    image = "docker.io/baserow/baserow:latest";

    environment = {
      "BASEROW_PUBLIC_URL" = "https://br.hl.sks-concept.de";
    };
    volumes = [
      "/home/${username}/containers/baserow/baserow_data:/baserow/data:rw"
    ];
    ports = [
      "3001:80"
    ];
    extraOptions = [
      "--network=dockernet"
    ];
  };
}