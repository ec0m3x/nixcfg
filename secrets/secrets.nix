let
    # Systems
    n1x-hs-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII95FnsCN1Kpk8TmkoV51LhRvZc3cFYGNUI3AF5tIaj9";
    n1x-cs-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHufMFtRMnGsX3+gnhbbcp7ogrr7rNBHTfIkB8YNHbZp";
    n1x-hs-2 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHxrw/sWU40yLeu1zcS5LnCEs5CdPOfGJnZrBRtQE0af";

    # Users
    ecomex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqiPSANwQ8T9MTUTRZLX9ug0K5fRGwOYbnI0bMZ7gjC";

    users = [ecomex];


in {
    "n1x-hs-1-cloudflare.age".publicKeys = users ++ [n1x-hs-1];
    "n1x-cs-1-cloudflare.age".publicKeys = users ++ [n1x-cs-1];
    "tailscalekey.age".publicKeys = users ++ [n1x-hs-2] ++ [n1x-hs-1] ++ [n1x-cs-1];
    "searx-key.age".publicKeys = users ++ [n1x-hs-1];
    "n8n.age".publicKeys = users ++ [n1x-hs-2] ++ [n1x-cs-1];
    "postgres.age".publicKeys = users ++ [n1x-hs-2] ++ [n1x-cs-1];
    "baserow.age".publicKeys = users ++ [n1x-hs-2] ++ [n1x-cs-1];
    "qdrant.age".publicKeys = users ++ [n1x-hs-2] ++ [n1x-cs-1];
}
