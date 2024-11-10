{
  pkgs,
  ...
}: {
  services.tailscale = {
    enable = true;
    authKeyFile = "/home/ecomex/.tailscalekey";
  };
}
