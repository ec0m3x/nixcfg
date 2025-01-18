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
      api = {};
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
        middlewares = {
          auth = {
            basicAuth = {
              users = ["ecomex:$apr1$b63e/oQ/$KmQimlF2DipIJpGx1vSES0"];
            };
          };
        };
        routers = {
          api = {
            rule = "Host(`traefik.sks-concept.de`)";
            service = "api@internal";
            middlewares = ["auth"];
            entrypoints = ["websecure"];
            tls = {
              certResolver = "cloudflare";
            };
          };
          portainer = {
            entryPoints = [ "websecure" ];
            rule = "Host(`docker.sks-concept.de`)";
            service = "portainer";
            tls = {
              certResolver = "cloudflare";
            };
          };
          actual-budget = {
            entryPoints = [ "websecure" ];
            rule = "Host(`budget.sks-concept.de`)";
            service = "actual-budget";
            tls = {
              certResolver = "cloudflare";
            };
          };
        };
        services = {
          portainer = {
            loadBalancer = {
              servers = [
                {
                  url = "http://localhost:9000/";
                }
              ];
            };
          };
          actual-budget = {
            loadBalancer = {
              servers = [
                {
                  url = "http://localhost:5006/";
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
  ];
}