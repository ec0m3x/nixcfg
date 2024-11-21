{
  imports = [ 
    ../common/services/extraServices
    ../common/hardware/printing.nix

    # Containers
    ../common/containers/openwebui
    ../common/containers/invokeai
  ];

  # Extra services
  extraServices.podman.enable = true;
  extraServices.gaming.enable = true;
  extraServices.ollama.enable = true;
  extraServices.libvirt.enable = true;
  extraServices.cachix.enable = true;
  extraServices.nfs-mount.enable = true;
  extraServices.syncthing.enable = true;

}
