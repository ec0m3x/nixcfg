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
      api.dashboard = true;
      # Access the Traefik dashboard on <Traefik IP>:8080 of your server
      api.insecure = false;

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
          n8n = {
            entryPoints = [ "websecure" ];
            rule = "Host(`n8n.sks-concept.de`)";
            service = "n8n";
          };
          dashboard-secure = {
            entryPoints = [ "websecure" ];
            rule = "Host(`traefik.sks-concept.de`)";
            service = "api@internal";
          };
          baserow = {
            entryPoints = [ "websecure" ];
            rule = "Host(`baserow.sks-concept.de`)";
            service = "baserow";
          };
          qdrant = {
            entryPoints = [ "websecure" ];
            rule = "Host(`vectordb.sks-concept.de`)";
            service = "qdrant";
          };
          portainer = {
            entryPoints = [ "websecure" ];
            rule = "Host(`docker.sks-concept.de`)";
            service = "portainer";
            tls = false;
          };
        };
        services = {
          n8n = {
            loadBalancer = {
              servers = [
                {
                  url = "http://localhost:5678";
                }
              ];
            };
          };
          baserow = {
            loadBalancer = {
              servers = [
                {
                  url = "http://localhost:3000";
                }
              ];
            };
          };
          qdrant = {
            loadBalancer = {
              servers = [
                {
                  url = "http://localhost:6333";
                }
              ];
            };
          };
          portainer = {
            loadBalancer = {
              servers = [
                {
                  url = "https://localhost:9443";
                }
              ];
            };
          };
        };
      };
    };
  };

  age.secrets.cloudflare-traefik = {
    file = "${self}/secrets/n1x-cs-1-cloudflare.age";
    mode = "600";
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
    8080
  ];
}