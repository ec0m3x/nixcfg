{
  imports = [ 
    ../common/services/extraServices
    ../common/services/backup
    ../common/services/forgejo.nix
    ../common/services/minecraft.nix
    ../common/services/reverse-proxy/traefik
  ];

  # Extra services
  extraServices.docker.enable = true;
}
