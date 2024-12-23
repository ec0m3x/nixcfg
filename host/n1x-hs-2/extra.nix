{
  imports = [
    ../common/services/extraServices
    
    # Containers
    ../common/containers/openwebui
    ../common/containers/invokeai
    ../common/containers/baserow
    ../common/containers/n8n
  ];

  # Extra services
  extraServices.docker.enable = true;
  extraServices.ollama-gpu.enable = false;
  extraServices.cachix.enable = true;
  extraServices.syncthing.enable = true;

/*   # Network 
  networking.firewall.allowedTCPPorts = [ 8083 ];
  networking.interfaces.enp42s0.wakeOnLan = {
    enable = true;
    policy = [ "magic" ];
  }; */
}
