{
  imports = [ 
    ../common/services/extraServices
    ../common/services/minecraft.nix
    ../common/services/reverse-proxy/traefik
  ];

  # Extra services
  extraServices.podman.enable = false;
  extraServices.n8n.enable = true;


}
