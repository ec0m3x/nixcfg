{ lib, ... }: {

  # Create directories and run scripts for the containers
  system.activationScripts = {
      script.text = ''
          install -d -m 755 /home/ecomex/containers/ollama/data -o root -g root
      '';
  };

  virtualisation.oci-containers = {
    containers."ollama" = {    
      image = "ollama/ollama";
      autoStart = true;
      ports = [ "11434:11434" ];
      volumes = [
        "/home/ecomex/containers/ollama/data:/root/.ollama"
      ];
      extraOptions = [
        "--device=nvidia.com/gpu=all"
        "--network=dockernet"
      ];
    };
  };
}