{ ... }: {

  services.immich = {
    enable = true;
    machine-learning.enable = true;
    host = "192.168.122.138";
    port = 5000;
    #mediaLocation = "/home/ecomex/immich_data";
  };
}