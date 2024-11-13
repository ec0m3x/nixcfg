let
    # Systems
    n1x-d3skt0p = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID46gTXMD1xUO83BWBUWdNDctdc7r/RdbZ1a0m2Lg6kh";

    systems = [n1x-d3skt0p];

    # Users
    ecomex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJR86g7+g3l7w1pLd40J/NcStNRNDIOnOXFYl775ySUQ";

    users = [ecomex];


in {
    "tailscale-key.age".publicKeys = systems ++ users;
}
