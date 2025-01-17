{ config, pkgs, inputs, unstable, ... }:
{
  disabledModules = [ "services/web-apps/stirling-pdf.nix" ];
  imports = [
    "${inputs.unstable}/nixos/modules/services/web-apps/stirling-pdf.nix"
  ];

  services.stirling-pdf = {
      enable = true;
      package = pkgs.unstable.stirling-pdf;
      environment = {
          SERVER_PORT = 9090;
          INSTALL_BOOK_AND_ADVANCED_HTML_OPS = "true";
      };
  };
}