{ config, self, ... }:
let
  tailnet = "taile8253.ts.net";
  domain = "hl.sks-concept.de";

  mkVHost = backend: ''
    tls {
      dns cloudflare {$CLOUDFLARE_TOKEN}
    }
    reverse_proxy ${backend}
  '';
in
{
  age.secrets.cloudflare = {
    file = "${self}/secrets/n1x-hs-cloudflare.age";
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
      "pdf.${domain}".extraConfig = mkVHost "http://localhost:9090";
      "dns.${domain}".extraConfig = mkVHost "http://localhost:82";
      "invoke.${domain}".extraConfig = mkVHost "http://10.20.50.30:9090";
      "chat.${domain}".extraConfig = mkVHost "http://10.20.50.30:3000";
      "n8n.${domain}".extraConfig = mkVHost "http://10.20.50.30:5678";
      "br.${domain}".extraConfig = mkVHost "http://10.20.50.30:3001";
      "sync-hs-1.${domain}".extraConfig = mkVHost "http://localhost:8384";
    };
  };
}
