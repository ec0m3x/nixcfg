{
  imports = [ 
    ../common/services/extraServices
    ../common/services/immich.nix
    ../common/services/reverse-proxy
    ../common/services/paperless-ngx.nix
    ../common/services/vaultwarden.nix
    ../common/services/nfs
    ../common/services/searx.nix
  ];

  # Extra services
  extraServices.podman.enable = true;
  extraServices.gaming.enable = false;
  extraServices.ollama.enable = false;
  extraServices.libvirt.enable = false;
  extraServices.cachix.enable = false;
  extraServices.syncthing.enable = true;

}
