let
    # Systems
    n1x-hd-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOVRevT9Y1XKuS5+MhWEXL3i4kA/l7UsT380bY2U6Oib";
    n1x-hs-1-vm = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIbbIKshoEQniUrFXDGfVV2hK1sKvafpK7et96YBbvAS";
    n1x-hs-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINqzb52vHcbbv4uG9IJsDS18u4Lmbuo0p3e7rCdX/wPh";

    # Users
    ecomex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqiPSANwQ8T9MTUTRZLX9ug0K5fRGwOYbnI0bMZ7gjC";

    users = [ecomex];


in {
    "n1x-hs-1-cloudflare.age".publicKeys = users ++ [n1x-hs-1] ++ [n1x-hs-1-vm];
    "tailscalekey.age".publicKeys = users ++ [n1x-hd-1] ++ [n1x-hs-1] ++ [n1x-hs-1-vm];
}
