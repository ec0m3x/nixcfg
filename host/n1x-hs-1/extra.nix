{
  imports = [
    ../common/services/extraServices
    ../common/services/immich.nix
    ../common/services/reverse-proxy/caddy
    ../common/services/paperless-ngx.nix
    ../common/services/vaultwarden.nix
    ../common/services/nfs
    ../common/services/searx.nix
    ../common/services/stirling.nix
  ];

  # Extra services
  extraServices.podman.enable = false;
  extraServices.gaming.enable = false;
  extraServices.n8n.enable = false;
  extraServices.libvirt.enable = false;
  extraServices.cachix.enable = false;
  extraServices.syncthing.enable = true;

}
