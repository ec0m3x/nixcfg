{ pkgs,  ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      vscode-marketplace.bbenoist.nix
      vscode-marketplace.catppuccin.catppuccin-vsc-icons
      vscode-marketplace.continue.continue
      vscode-marketplace.ms-azuretools.vscode-docker
      vscode-marketplace.dart-code.dart-code
      vscode-marketplace.dart-code.flutter
      vscode-marketplace.github.copilot
      vscode-marketplace.github.copilot-chat
      vscode-marketplace.github.vscode-github-actions
      vscode-marketplace.github.vscode-pull-request-github
      vscode-marketplace.ms-vscode-remote.remote-ssh
      vscode-marketplace.pkief.material-product-icons
      vscode-marketplace.ms-python.python
      vscode-marketplace.vscode-icons-team.vscode-icons
      vscode-marketplace.catppuccin.catppuccin-vsc
    ];
    mutableExtensionsDir = true;
  };

  home.packages = with pkgs; [ sublime-merge ];
}
