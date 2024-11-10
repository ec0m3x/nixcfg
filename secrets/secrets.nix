let
    n1x-d3skt0p = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH+d8vUHll4ChKWNI3l5jIX+wEIo2anmF8Zvv6wex86G";
in {
    "ecomex-secrets.age".publicKeys = [ n1x-d3skt0p ];
    "tailscale-key.age".publicKeys = [ n1x-d3skt0p ];
}
