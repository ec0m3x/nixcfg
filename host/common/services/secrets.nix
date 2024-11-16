{
  age = {
    secrets = {
      tailscale-key = {
        file = ../../../secrets/tailscale-key.age;
        owner = "ecomex";
        path = "/home/ecomex/.tailscalekey";
      };
    };
  };
}
