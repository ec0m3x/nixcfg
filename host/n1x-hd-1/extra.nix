{
  imports = [ 
    ../common/services/extraServices
  ];

  # Extra services
  extraServices.podman.enable = true;
  extraServices.gaming.enable = true;
  extraServices.ollama.enable = false;
  extraServices.libvirt.enable = true;
  extraServices.cachix.enable = true;

}
