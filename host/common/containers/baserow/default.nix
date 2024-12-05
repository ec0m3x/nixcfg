{ self, config, pkgs, lib, ... }:

{
  virtualisation.oci-containers.containers."baserow" = {
    image = "baserow/baserow:1.29.3";

    environment = {
      "BASEROW_PUBLIC_URL" = "https://baserow.sks-concept.de";
    };
    volumes = [
      "baserow_data:/baserow/data:rw"
    ];
    ports = [
      "3000:80"
    ];
  };
}