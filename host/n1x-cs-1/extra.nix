{
  imports = [ 
    ../common/services/extraServices
    ../common/services/minecraft.nix
  ];

  # Extra services
  extraServices.podman.enable = true;

}
