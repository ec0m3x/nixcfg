{ lib, hostname, ... }:
let
  # Firewall configuration variable for syncthing
  syncthing = {
    hosts = [
      "n1x-hd-1"
      "n1x-hs-1"
    ];
    tcpPorts = [ 22000 ];
    udpPorts = [
      22000
      21027
    ];
  };
in
{
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = lib.optionals (builtins.elem hostname syncthing.hosts) syncthing.tcpPorts;
      allowedUDPPorts = lib.optionals (builtins.elem hostname syncthing.hosts) syncthing.udpPorts;
    };
  };
}