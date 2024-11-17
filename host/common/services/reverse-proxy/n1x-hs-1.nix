{ config, self, ... }:
let
  tailnet = "taile8253.ts.net";
  domain = "sks-concept.de";

  mkVHost = backend: ''
    tls {
      dns digitalocean {$DO_AUTH_TOKEN}
    }
    reverse_proxy ${backend}
  '';
in
{

  services = {
    # Enable caddy to talk to the tailscale daemon for certs
    tailscale.permitCertUid = "caddy";

    caddy.virtualHosts = {
      "files.${domain}".extraConfig = mkVHost "http://localhost:8081";
      "ha.${domain}".extraConfig = mkVHost "http://localhost:8123";
      "photos.${domain}".extraConfig = mkVHost "http://localhost:3001";
      "freyja.sync.${domain}".extraConfig = mkVHost "http://freyja.${tailnet}:8384";
      "kara.sync.${domain}".extraConfig = mkVHost "http://kara.${tailnet}:8384";
      "thor.sync.${domain}".extraConfig = mkVHost "http://thor.${tailnet}:8384";
    };
  };
}
