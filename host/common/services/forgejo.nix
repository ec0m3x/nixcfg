{ self, lib, pkgs, config, ... }:
let
  cfg = config.services.forgejo;
  srv = cfg.settings.server;
in
{
    age.secrets.forgejo-mailer-password = {
    file = "${self}/secrets/forgejo-mailer-password.age";
    mode = "400";
    owner = "forgejo";
  };
  
  age.secrets.forgejo-admin-password = {
    file = "${self}/secrets/forgejo-admin-password.age";
    owner = "forgejo";
  };

  services.forgejo = {
    enable = true;
    database.type = "postgres";
    # Enable support for Git Large File Storage
    lfs.enable = true;
    settings = {
      server = {
        DOMAIN = "git.sks-concept.de";
        # You need to specify this to remove the port from URLs in the web UI.
        ROOT_URL = "https://${srv.DOMAIN}/"; 
        HTTP_PORT = 3000;
      };
      # You can temporarily allow registration to create an admin user.
      service.DISABLE_REGISTRATION = true;
      # Add support for actions, based on act: https://github.com/nektos/act
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "github";
      };
      # Sending emails is completely optional
      # You can send a test email from the web UI at:
      # Profile Picture > Site Administration > Configuration >  Mailer Configuration 
      mailer = {
        ENABLED = true;
        SMTP_ADDR = "smtp.ionos.de";
        FROM = "skoch@sks-concept.de";
        USER = "skoch@sks-concept.de";
      };
    };
    secrets.mailer.PASSWD = config.age.secrets.forgejo-mailer-password.path;
  };

  systemd.services.forgejo.preStart = let 
    adminCmd = "${lib.getExe cfg.package} admin user";
    pwd = config.age.secrets.forgejo-admin-password;
    user = "ecomex"; # Note, Forgejo doesn't allow creation of an account named "admin"
  in ''
    ${adminCmd} create --admin --email "skoch@sks-concept.de" --username ${user} --password "$(tr -d '\n' < ${pwd.path})" || true
    ## uncomment this line to change an admin user which was already created
    # ${adminCmd} change-password --username ${user} --password "$(tr -d '\n' < ${pwd.path})" || true
  '';
}