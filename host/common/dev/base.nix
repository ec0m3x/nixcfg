{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Rust tooling
    cargo
    rust-analyzer
    rustfmt
    rustc

    gnumake
    gcc

    nodejs

    spread

    # Container tooling
    dive
    kubectl
    skopeo

    # Go tooling
    go
    go-tools
    gofumpt
    gopls

    # Nix tooling
    deadnix
    nil
    nix-init
    nixfmt-rfc-style
    nurl
    statix

    # Python tooling
    ruff
    uv
    (pkgs.python3.withPackages (
      p: with p; [
        tox
        virtualenv
      ]
    ))

    # Shell tooling
    shellcheck
    shfmt
  ];
}
