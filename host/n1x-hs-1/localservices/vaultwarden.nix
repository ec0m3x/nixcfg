{ ... }: {

  services.vaultwarden = {
    enable = true;
    config = {
        ROCKET_ADDRESS = "192.168.122.138";
        ROCKET_PORT = 8222;
    };
  };
}