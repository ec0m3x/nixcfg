{ pkgs, ... }:{
  # Powermanagement
  powerManagement.powertop.enable = true;

  # Networkd-dispatcher for tailscale
  services.networkd-dispatcher = {
    enable = true;
    rules."50-tailscale" = {
      onState = ["routable"];
      script = ''
        ${pkgs.ethtool}/bin/ethtool -K $(ip -o route get 8.8.8.8 | cut -f 5 -d " ") rx-udp-gro-forwarding on rx-gro-list off
      '';
    };
  };
}
