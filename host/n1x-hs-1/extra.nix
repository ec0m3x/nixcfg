{
  imports = [ 
    ../common/services/extraServices
    ../common/services/immich.nix

  ];

  # Extra services
  extraServices.podman.enable = true;
  extraServices.gaming.enable = false;
  extraServices.ollama.enable = false;
  extraServices.libvirt.enable = false;
  extraServices.cachix.enable = false;

}
