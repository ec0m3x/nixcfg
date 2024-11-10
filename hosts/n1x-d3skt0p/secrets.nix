{
  age = {
    secrets = {
      ecomex-secrets = {
        file = ../../secrets/ecomex-secrets.age;
        owner = "ecomex";
      };
      tailscale-key = {
        file = ../../secrets/tailscale-key.age;
        owner = "ecomex";
        path = "/home/ecomex/.tailscalekey";
      };
    };
  };
}
