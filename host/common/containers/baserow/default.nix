{ self, config, pkgs, lib, ... }:

{
  age.secrets.baserow = {
    file = "${self}/secrets/baserow.age";
    mode = "600";
  };
  
  virtualisation.oci-containers.containers."baserow" = {
    image = "baserow/baserow:1.29.3";
    environmentFiles = [
      config.age.secrets.baserow.path
    ];
    environment = {
      "BASEROW_PUBLIC_URL" = "https://baserow.sks-concept.de";
      "DATABASE_HOST" = "postgres";
      "DATABASE_NAME" = "baserow";
      "DATABASE_USER" = "ecomex";
      
    };
    volumes = [
      "baserow_data:/baserow/data:rw"
    ];
    ports = [
      "3000:80"
    ];
    extraOptions = [
      "--network=localAI"
    ];
  };
}