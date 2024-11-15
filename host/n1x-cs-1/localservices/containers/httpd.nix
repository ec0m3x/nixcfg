{
  containers.httpd = {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";
    forwardPorts = [
      {
        containerPort = 80;
        hostPort = 80;
      }
    ];
    config = { ... }: {
      services.httpd = {
        enable = true;
        adminAddr = "foo@example.com";
      };
      networking.firewall.allowedTCPPorts = [80];
      system.stateVersion = "24.05";
    };
    bindMounts = {
      "/root/data" = {
        hostPath = "/home/ecomex/data/";
        isReadOnly = false;
      };
    };
  };
}