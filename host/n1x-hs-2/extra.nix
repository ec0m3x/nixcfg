{
  imports = [
    ../common/services/extraServices
    
    # Containers
    ../common/containers/openwebui
    ../common/containers/invokeai
    ../common/containers/baserow

  ];

  # Extra services
  extraServices.podman.enable = false;
  extraServices.docker.enable = true;
  extraServices.gaming.enable = false;
  extraServices.ollama-gpu.enable = true;
  extraServices.n8n.enable = false;
  extraServices.postgres.enable = false;
  extraServices.libvirt.enable = true;
  extraServices.cachix.enable = true;
  extraServices.nfs-mount.enable = false;
  extraServices.syncthing.enable = true;
  extraServices.cockpit.enable = true;
  

  # Network 
  networking.firewall.allowedTCPPorts = [ 8083 ];
  networking.interfaces.enp42s0.wakeOnLan = {
    enable = true;
    policy = [ "magic" ];
  };
}
