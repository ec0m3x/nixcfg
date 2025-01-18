{
  description = "3c0m3x's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    master.url = "github:nixos/nixpkgs/master";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:catppuccin/nix";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    lanzaboote.url = "github:nix-community/lanzaboote";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    vscode-server.url = "github:nix-community/nixos-vscode-server";
    vscode-server.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    compose2nix.url = "github:aksiksi/compose2nix";
    compose2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      unstable,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      stateVersion = "24.11";
      username = "ecomex";

      libx = import ./lib {
        inherit
          self
          inputs
          outputs
          stateVersion
          username
          ;
      };
    in
    {
      # nix build .#homeConfigurations."ecomex@n1x-ais".activationPackage
      homeConfigurations = {
        # Desktop machines
        "${username}@n1x-hd" = libx.mkHome { hostname = "n1x-hd"; desktop = "plasma";};
        # Headless machines
        "${username}@n1x-hs" = libx.mkHome { hostname = "n1x-hs"; };
        "${username}@n1x-cs" = libx.mkHome { hostname = "n1x-cs"; };
      };

      # nix build .#nixosConfigurations.n1x-ais.config.system.build.toplevel
      nixosConfigurations = {
        # Desktop machines
        n1x-hd = libx.mkHost {
          hostname = "n1x-hd";
          desktop = "plasma";
        };
        # Headless machines
        n1x-hs = libx.mkHost {
          hostname = "n1x-hs";
        };
        n1x-cs = libx.mkHost {
          hostname = "n1x-cs";
        };
      };
      
      #nix run nix-darwin -- switch --flake ~/nixos-config
      #nix build .#darwinConfigurations.{hostname}.config.system.build.toplevel
      darwinConfigurations = {
        # Laptop
        macbook = libx.mkDarwin {
          hostname = "macbook";
        };
      };

      # Custom packages; acessible via 'nix build', 'nix shell', etc
      packages = libx.forAllSystems (
        system:
        let
          pkgs = unstable.legacyPackages.${system};
        in
        import ./pkgs { inherit pkgs; }
      );

      # Custom overlays
      overlays = import ./overlays { inherit inputs; };

      # Devshell for bootstrapping
      # Accessible via 'nix develop' or 'nix-shell' (legacy)
      devShells = libx.forAllSystems (
        system:
        let
          pkgs = unstable.legacyPackages.${system};
        in
        import ./shell.nix { inherit pkgs; }
      );

      formatter = libx.forAllSystems (system: self.packages.${system}.nixfmt-plus);
    };
}