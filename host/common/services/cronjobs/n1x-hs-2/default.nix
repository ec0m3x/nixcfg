{ ... }:{
  services.cron.systemCronJobs = [
    "0 22 * * * root /sbin/shutdown -h now"
  ];
}