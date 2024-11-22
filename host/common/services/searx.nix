{ pkgs, ... }: 
{
  services.searx = {
    enable = true;
    settings = {
      server.port = 8080;
      server.bind_address = "0.0.0.0";
      server.base_url = "https://search.sks-concept.de";
    };
  };
}