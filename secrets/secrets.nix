let
    # Systems
    n1x-hd-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOVRevT9Y1XKuS5+MhWEXL3i4kA/l7UsT380bY2U6Oib";
    n1x-hs-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII95FnsCN1Kpk8TmkoV51LhRvZc3cFYGNUI3AF5tIaj9";

    # Users
    ecomex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqiPSANwQ8T9MTUTRZLX9ug0K5fRGwOYbnI0bMZ7gjC";

    users = [ecomex];


in {
    "n1x-hs-1-cloudflare.age".publicKeys = users ++ [n1x-hs-1];
    "tailscalekey.age".publicKeys = users ++ [n1x-hd-1] ++ [n1x-hs-1];
}
