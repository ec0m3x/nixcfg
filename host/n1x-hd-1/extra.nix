{
  imports = [ 
    ../common/services/extraServices
    ../common/hardware/printing.nix

    # Containers
    ../common/containers/openwebui
    ../common/containers/invokeai
    #../common/containers/n8n
  ];

  # Extra services
  extraServices.podman.enable = false;
  extraServices.docker.enable = true;
  extraServices.gaming.enable = true;
  extraServices.ollama-gpu.enable = true;
  extraServices.n8n.enable = true;
  extraServices.postgres.enable = true;
  extraServices.libvirt.enable = true;
  extraServices.cachix.enable = true;
  extraServices.nfs-mount.enable = true;
  extraServices.syncthing.enable = true;

}
