{
  imports = [ 
    ../common/services/extraServices
    ../common/services/minecraft.nix
    ../common/services/reverse-proxy
  ];

  # Extra services
  extraServices.podman.enable = true;
  extraServices.n8n.enable = true;


}
