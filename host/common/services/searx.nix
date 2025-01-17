{ self, config, ... }: 
{
  services.searx = {
    enable = true;
    environmentFile = config.age.secrets.searx-key.path;
    settings = {
      server.port = 8181;
      server.bind_address = "0.0.0.0";
      server.base_url = "https://search.hl.sks-concept.de";
      server.secret_key = "@SEARX_SECRET_KEY@";
    };
  };

  age.secrets.searx-key = {
    file = "${self}/secrets/searx-key.age";
    owner = "ecomex";
    group = "users";
    mode = "600";
  };
}