{
  imports = [
    ../common/services/extraServices
    ../common/services/backup
    ../common/services/immich.nix
    ../common/services/reverse-proxy/caddy
    ../common/services/paperless-ngx.nix
    ../common/services/vaultwarden.nix
    ../common/services/network/nfs
    ../common/services/network/samba
    ../common/services/searx.nix
    ../common/services/stirling.nix
    ../common/services/adguardhome.nix
  ];

  # Extra services
  extraServices.syncthing.enable = true;
}