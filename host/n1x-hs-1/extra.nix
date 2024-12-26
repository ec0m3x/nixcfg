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
  extraServices.syncthing.enable = true;
}
