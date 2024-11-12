let
    n1x-d3skt0p = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID2IkvIN8TZJjSRzb8k1jeJd+y5neI5zkoOF+QZWVo1S";

in {
    "ecomex-secrets.age".publicKeys = [ n1x-d3skt0p ];
    "tailscale-key.age".publicKeys = [ n1x-d3skt0p ];
}
