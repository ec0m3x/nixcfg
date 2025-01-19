{ lib, ... }: {

  # Create directories and run scripts for the containers
  system.activationScripts = {
      script.text = ''
          install -d -m 755 /home/ecomex/containers/invokeai/data -o root -g root
      '';
  };

  # Container configuration for InvokeAI
  virtualisation.oci-containers = {
    containers."invokeai" = {    
      image = "ghcr.io/invoke-ai/invokeai";
      autoStart = true;
      ports = [
        "9090:9090"
        ];
      volumes = [
        "/home/ecomex/containers/invokeai/data:/invokeai"
      ];
      extraOptions = [
        "--device=nvidia.com/gpu=all" 
        "--network=dockernet"
      ];
    };
  };
}