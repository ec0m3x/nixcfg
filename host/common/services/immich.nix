{ pkgs, ... }:
{

  services.immich = {
    enable = true;
    package = pkgs.immich;
    host = "127.0.0.1";
    openFirewall = true;
    port = 3001;
    mediaLocation = "/home/ecomex/immich";

    redis = {
      enable = true;
      host = "127.0.0.1";
      port = 6379;
    };
  };
}
