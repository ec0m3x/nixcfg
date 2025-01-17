{ pkgs, ... }:
{
  services.vaultwarden = {
    enable = true;
     config = {
      DOMAIN = "https://vault.hl.sks-concept.de";
      SIGNUPS_ALLOWED = true;
    };
  };
}