let
    # Systems
    n1x-hs = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII95FnsCN1Kpk8TmkoV51LhRvZc3cFYGNUI3AF5tIaj9";
    n1x-cs = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHufMFtRMnGsX3+gnhbbcp7ogrr7rNBHTfIkB8YNHbZp";
    n1x-hd = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDYKLEcmUlVZAhMiYsKO0GnF4aUd/IWd7UQ7mwlT8Jnv";

    # Users
    ecomex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqiPSANwQ8T9MTUTRZLX9ug0K5fRGwOYbnI0bMZ7gjC";

    users = [
      ecomex
    ];

    systems = [
      n1x-hs
      n1x-cs
      n1x-hd
    ];


in {
    "n1x-hs-cloudflare.age".publicKeys = users ++ systems;
    "n1x-cs-cloudflare.age".publicKeys = users ++ systems;
    "tailscalekey.age".publicKeys = users ++ systems;
    "searx-key.age".publicKeys = users ++ systems;
    "n8n.age".publicKeys = users ++ systems;
    "postgres.age".publicKeys = users ++ systems;
    "baserow.age".publicKeys = users ++ systems;
    "qdrant.age".publicKeys = users ++ systems;

    # Forgejo
    "forgejo-mailer-password.age".publicKeys = users ++ systems;
    "forgejo-admin-password.age".publicKeys = users ++ systems;

    #borgbase
    "n1x-hs-borgbase-ssh.age".publicKeys = users ++ systems;
    "n1x-hs-borgbase-passphrase.age".publicKeys = users ++ systems;
    "n1x-hd-borgbase-ssh.age".publicKeys = users ++ systems;
    "n1x-hd-borgbase-passphrase.age".publicKeys = users ++ systems;
    "n1x-cs-borgbase-ssh.age".publicKeys = users ++ systems;
    "n1x-cs-borgbase-passphrase.age".publicKeys = users ++ systems;
}
