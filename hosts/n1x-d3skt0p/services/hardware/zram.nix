{ pkgs, ...}: {

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    #memoryMax = 20;
    memoryPercent = 10;
  };
}