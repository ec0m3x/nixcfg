{ self, config, pkgs, lib, username, ... }:

{
  # Network
  system.activationScripts.createDockerNetworkN8n = lib.mkAfter ''
    if ! /run/current-system/sw/bin/docker network inspect baserow >/dev/null 2>&1; then
      /run/current-system/sw/bin/docker network create baserow
    fi
  '';

  # Containers
  virtualisation.oci-containers.containers."baserow" = {
    image = "baserow/baserow:1.29.3";

    environment = {
      "BASEROW_PUBLIC_URL" = "https://br.hl.sks-concept.de";
    };
    volumes = [
      "/home/${username}/containers/baserow/baserow_data:/baserow/data:rw"
    ];
    ports = [
      "3001:80"
    ];
    extraOptions = ["--network=baserow"];
  };
}