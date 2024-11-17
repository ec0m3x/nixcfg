{ pkgs, ... }:
{
  services.vaultwarden = {
    enable = true;
     config = {
      DOMAIN = "https://vault.sks-concept.de";
      SIGNUPS_ALLOWED = true;
    };
  };
}