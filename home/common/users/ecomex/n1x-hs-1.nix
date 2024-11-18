_: {
  services.syncthing = {
    enable = true;
    extraOptions = [
      "-gui-address=n1x-hs-1.taile8253.ts.net:8384"
      "-home=/home/ecomex/.syncthing"
    ];
  };
}