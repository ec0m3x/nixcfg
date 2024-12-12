{ ... }: {

  imports = [
    ./n1x-hs-1
    ./n1x-hs-2
  ]

  services.cron = {
    enable = true;
  };
}