{
  self,
  inputs,
  outputs,
  stateVersion,
  username,
  ...
}:
{
  # Helper function for generating home-manager configs
  mkHome =
    {
      hostname,
      user ? username,
      desktop ? null,
      system ? "x86_64-linux",
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit
          self
          inputs
          outputs
          stateVersion
          hostname
          desktop
          ;
        username = user;
      };
      modules = [
        inputs.catppuccin.homeManagerModules.catppuccin
        ../home
      ];
    };

  # Helper function for generating host configs
  mkHost =
    {
      hostname,
      desktop ? null,
      pkgsInput ? inputs.nixpkgs,
    }:
    pkgsInput.lib.nixosSystem {
      specialArgs = {
        inherit
          self
          inputs
          outputs
          stateVersion
          username
          hostname
          desktop
          ;
      };
      modules = [
        inputs.agenix.nixosModules.default
        inputs.lanzaboote.nixosModules.lanzaboote
        ../host
      ];
    };
  mkDarwin =
    {
      hostname,
      user ? username,
      desktop ? null,
      system ? "aarch64-darwin",
    }:
    inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit
          self
          inputs
          outputs
          stateVersion
          hostname
          desktop
          system
          ;
        username = user;
      };
      modules = [
        ../darwin
      ];
    };

  forAllSystems = inputs.nixpkgs.lib.genAttrs [
    "aarch64-linux"
    "i686-linux"
    "x86_64-linux"
    "aarch64-darwin"
    "x86_64-darwin"
  ];
}
