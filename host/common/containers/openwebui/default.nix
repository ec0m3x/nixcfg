{ lib, ... }: {

  # Create directories and run scripts for the containers
  system.activationScripts = {
      script.text = ''
          install -d -m 755 /home/ecomex/containers/open-webui/data -o root -g root
      '';
  };

  virtualisation.oci-containers = {
    containers."open-webui" = {
      image = "ghcr.io/open-webui/open-webui:main";
      autoStart = true;
      environment = {
        "TZ" = "Europe/Berlin";
        "OLLAMA_API_BASE_URL" = "http://127.0.0.1:11434/api";
        "OLLAMA_BASE_URL" = "http://127.0.0.1:11434";
      };
      ports = ["3000:8080"];
      volumes = [
        "/home/ecomex/containers/open-webui/data:/app/backend/data"
      ];
      extraOptions = [
        #"--add-host=host.docker.internal:host-gateway"
        "--network=local-ai"
      ];
    };
  };
}