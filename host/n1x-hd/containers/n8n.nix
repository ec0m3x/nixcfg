{ ... }:{

  # Container configuration for n8n
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
      "--network=dockernet"
      "--add-host=host.docker.internal:host-gateway"
    ];
  };
}
