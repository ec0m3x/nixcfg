{ pkgs, ... }:
{
  services.adguardhome = {
    enable = true;
    openFirewall=true;
    host = "10.20.50.40";
    port = 3002;
  };
}