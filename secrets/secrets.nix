let
    # Systems
    n1x-hd-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEbBNCM3ZdvGtqnMjKcd8O4MYibwmy4mScxZp+GFLnHM";
    n1x-hs-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII95FnsCN1Kpk8TmkoV51LhRvZc3cFYGNUI3AF5tIaj9";
    n1x-cs-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHufMFtRMnGsX3+gnhbbcp7ogrr7rNBHTfIkB8YNHbZp";

    # Users
    ecomex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqiPSANwQ8T9MTUTRZLX9ug0K5fRGwOYbnI0bMZ7gjC";

    users = [ecomex];


in {
    "n1x-hs-1-cloudflare.age".publicKeys = users ++ [n1x-hs-1];
    "tailscalekey.age".publicKeys = users ++ [n1x-hd-1] ++ [n1x-hs-1] ++ [n1x-cs-1];
    "searx-key.age".publicKeys = users ++ [n1x-hs-1];
}
