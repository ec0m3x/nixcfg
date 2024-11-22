{ config, self, ... }:
let
  tailnet = "taile8253.ts.net";
  domain = "sks-concept.de";

  mkVHost = backend: ''
    tls {
      dns cloudflare {$CLOUDFLARE_TOKEN}
    }
    reverse_proxy ${backend}
  '';
in
{
  age.secrets.cloudflare = {
    file = "${self}/secrets/n1x-hs-1-cloudflare.age";
    owner = "caddy";
    group = "caddy";
    mode = "600";
  };

  # Ensure DigitalOcean token is in Caddy's environment
  systemd.services.caddy.serviceConfig.EnvironmentFile = config.age.secrets.cloudflare.path;

  services = {
    # Enable caddy to talk to the tailscale daemon for certs
    tailscale.permitCertUid = "caddy";

    caddy.virtualHosts = {
      "photos.${domain}".extraConfig = mkVHost "http://localhost:3001";
      "docs.${domain}".extraConfig = mkVHost "http://localhost:28981";
      "vault.${domain}".extraConfig = mkVHost "http://localhost:8000";
      "search.${domain}".extraConfig = mkVHost "http://localhost:8181";
    };
  };
}
