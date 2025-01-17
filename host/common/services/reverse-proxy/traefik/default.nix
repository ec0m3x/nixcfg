{ self, config, pkgs, ... }:
{
  services.traefik = {
    enable = true;
    environmentFiles = [ "${config.age.secrets.cloudflare-traefik.path}" ];
    staticConfigOptions = {
      entryPoints = {
        web = {
          address = ":80";
          asDefault = true;
          http.redirections.entrypoint = {
            to = "websecure";
            scheme = "https";
          };
        };
        websecure = {
          address = ":443";
          asDefault = true;
          http.tls.certResolver = "cloudflare";
        };
      };
      #api.dashboard = true;
      # Access the Traefik dashboard on <Traefik IP>:8080 of your server
      #api.insecure = false;

      certificatesResolvers = {
        cloudflare = {
          acme = {
            email = "skoch@sks-concept.de";
            storage = "${config.services.traefik.dataDir}/acme.json";
            caServer = "https://acme-v02.api.letsencrypt.org/directory";
            dnsChallenge = {
              provider = "cloudflare";
              resolvers = [ "1.1.1.1:53" "8.8.8.8:53" ];
            };
          };
        };
      };
    };
    dynamicConfigOptions = {
      http = {
        routers = {
          portainer = {
            entryPoints = [ "websecure" ];
            rule = "Host(`docker.sks-concept.de`)";
            service = "portainer";
            tls = false;
          };
          actual-budget = {
            entryPoints = [ "websecure" ];
            rule = "Host(`budget.sks-concept.de`)";
            service = "actual-budget";
            tls = false;
          };
          forgejo = {
            entryPoints = [ "websecure" ];
            rule = "Host(`git.sks-concept.de`)";
            service = "forgejo";
            tls = false;
          };
        };
        services = {
          portainer = {
            loadBalancer = {
              servers = [
                {
                  url = "https://localhost:9443";
                }
              ];
            };
          };
          actual-budget = {
            loadBalancer = {
              servers = [
                {
                  url = "http://localhost:5006";
                }
              ];
            };
          };
          forgejo = {
            loadBalancer = {
              servers = [
                {
                  url = "http://localhost:3000";
                }
              ];
            };
          };
        };
      };
    };
  };

  age.secrets.cloudflare-traefik = {
    file = "${self}/secrets/n1x-cs-cloudflare.age";
    mode = "600";
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
    8080
  ];
}