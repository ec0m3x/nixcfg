{
  imports = [
    ../common/services/extraServices
    
    # Containers
    ../common/containers/openwebui
    ../common/containers/invokeai
  ];

  # Extra services
  extraServices.podman.enable = false;
  extraServices.docker.enable = true;
  extraServices.gaming.enable = false;
  extraServices.ollama-gpu.enable = true;
  extraServices.n8n.enable = true;
  extraServices.postgres.enable = true;
  extraServices.libvirt.enable = true;
  extraServices.cachix.enable = true;
  extraServices.nfs-mount.enable = false;
  extraServices.syncthing.enable = true;

}
