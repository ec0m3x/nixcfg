{
  imports = [ 
    ../common/services/extraServices
  ];

  # Extra services
  extraServices.podman.enable = true;
  extraServices.gaming.enable = false;
  extraServices.ollama.enable = false;
  extraServices.libvirt.enable = false;
  extraServices.cachix.enable = false;

}
