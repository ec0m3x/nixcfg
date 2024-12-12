{
  imports = [ 
    ../common/services/extraServices
    ../common/services/minecraft.nix
    ../common/services/reverse-proxy/traefik
    ../common/containers/n8n
  ];

  # Extra services
  extraServices.podman.enable = false;
  extraServices.docker.enable = true;
  extraServices.n8n.enable = false;


}
