let
    n1x-d3skt0p = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAWYQOJ7Bt3ndjjBpKzs0z0F0KOgGmyPLPN4x95ZPIQX";
in {
    "ecomex-secrets.age".publicKeys = [ n1x-d3skt0p ];
    "tailscale-key.age".publicKeys = [ n1x-d3skt0p ];
}
