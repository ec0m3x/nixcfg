{ config, self, ... }:{

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
    authKeyFile = config.age.secrets.tailscalekey.path;
    openFirewall = true;
  };

  age.secrets.tailscalekey = {
    file = "${self}/secrets/tailscalekey.age";
    owner = "ecomex";
    group = "users";
    mode = "600";
  };

  networking.firewall.trustedInterfaces = [ "tailscale0" ];
}
