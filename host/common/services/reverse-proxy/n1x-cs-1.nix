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
    file = "${self}/secrets/n1x-cs-1-cloudflare.age";
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
      "n8n.${domain}".extraConfig = mkVHost "http://localhost:5678";
    };
  };
}
