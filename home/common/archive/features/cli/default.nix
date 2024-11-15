{
  pkgs,
  ...
}: {
  imports = [
    ./fish.nix
    ./foot.nix
    ./fzf.nix
    ./neofetch.nix
  ];

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    extraOptions = ["-l" "--icons" "--git" "-a"];
  };

  programs.bat = {enable = true;};

  home.packages = with pkgs; [
    coreutils
    fd
    htop
    btop
    httpie
    jq
    procs
    ripgrep
    tldr
    zip
    unzip
    nerdfetch
  ];
}