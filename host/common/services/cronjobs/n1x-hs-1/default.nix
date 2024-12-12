{ ... }:{
  services.cron.systemCronJobs = [
    "0 5 * * * ecomex /usr/bin/wakeonlan 00:1A:2B:3C:4D:5E"
  ];
}