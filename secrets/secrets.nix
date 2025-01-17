let
    # Systems
    n1x-hs = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII95FnsCN1Kpk8TmkoV51LhRvZc3cFYGNUI3AF5tIaj9";
    n1x-cs = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHufMFtRMnGsX3+gnhbbcp7ogrr7rNBHTfIkB8YNHbZp";
    n1x-hd = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDYKLEcmUlVZAhMiYsKO0GnF4aUd/IWd7UQ7mwlT8Jnv";

    # Users
    ecomex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqiPSANwQ8T9MTUTRZLX9ug0K5fRGwOYbnI0bMZ7gjC";

    users = [ecomex];


in {
    "n1x-hs-cloudflare.age".publicKeys = users ++ [n1x-hs];
    "n1x-cs-cloudflare.age".publicKeys = users ++ [n1x-cs];
    "tailscalekey.age".publicKeys = users ++ [n1x-hd] ++ [n1x-hs] ++ [n1x-cs];
    "searx-key.age".publicKeys = users ++ [n1x-hs];
    "n8n.age".publicKeys = users ++ [n1x-hd] ++ [n1x-cs];
    "postgres.age".publicKeys = users ++ [n1x-hd] ++ [n1x-cs];
    "baserow.age".publicKeys = users ++ [n1x-hd] ++ [n1x-cs];
    "qdrant.age".publicKeys = users ++ [n1x-hd] ++ [n1x-cs];

    # Forgejo
    "forgejo-mailer-password.age".publicKeys = users ++ [n1x-cs];
    "forgejo-admin-password.age".publicKeys = users ++ [n1x-cs];

    #borgbase
    "n1x-hs-borgbase-ssh.age".publicKeys = users ++ [n1x-hs];
    "n1x-hs-borgbase-passphrase.age".publicKeys = users ++ [n1x-hs];
    "n1x-hd-borgbase-ssh.age".publicKeys = users ++ [n1x-hd];
    "n1x-hd-borgbase-passphrase.age".publicKeys = users ++ [n1x-hd];
    "n1x-cs-borgbase-ssh.age".publicKeys = users ++ [n1x-cs];
    "n1x-cs-borgbase-passphrase.age".publicKeys = users ++ [n1x-cs];
}
