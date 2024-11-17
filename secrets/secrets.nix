let
    # Systems
    n1x-hd-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOVRevT9Y1XKuS5+MhWEXL3i4kA/l7UsT380bY2U6Oib";

    systems = [n1x-hd-1];

    # Users
    ecomex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqiPSANwQ8T9MTUTRZLX9ug0K5fRGwOYbnI0bMZ7gjC";

    users = [ecomex];


in {
    "tailscale-key.age".publicKeys = systems ++ users;
}
