{ pkgs, unstable, ... }:
{

  services.immich = {
    enable = true;
    package = pkgs.unstable.immich;
    host = "127.0.0.1";
    openFirewall = true;
    port = 3001;

    redis = {
      enable = true;
      host = "127.0.0.1";
      port = 6379;
    };
  };
}
