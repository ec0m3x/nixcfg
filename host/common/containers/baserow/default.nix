{ lib, ... }: {

  # Create directories and run scripts for the containers
  system.activationScripts.baserow = {
      text = ''
          # Create data directory for baserow
          install -d -m 755 /home/ecomex/containers/baserow/data -o root -g root
      '';
  };

  virtualisation.oci-containers = {
    containers."baserow" = {
      image = "docker.io/baserow/baserow:1.29.3";
      autoStart = true;
      environment = {
        "BASEROW_PUBLIC_URL" = "https://baserow.sks-concept.de";
      };
      ports = ["80:8585"];
      volumes = [
        "/home/ecomex/containers/baserow/data:/baserow/data"
      ];
      extraOptions = ["--network=host"];
    };
  };
}