let
    # Systems
    n1x-hd-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE/8c3TzIsCQluCDKwN+HR1SedxmC8dsde5OYzSc6mwT";

    systems = [n1x-hd-1];

    # Users
    ecomex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqiPSANwQ8T9MTUTRZLX9ug0K5fRGwOYbnI0bMZ7gjC";

    users = [ecomex];


in {
    "tailscale-key.age".publicKeys = systems ++ users;
}
