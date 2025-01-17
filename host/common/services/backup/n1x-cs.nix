_: {
  # In order to mount the backup to restore files, perform the following:
  #
  #    mkdir backup
  #    sudo borg-job-borgbase mount ike67cye@ike67cye.repo.borgbase.com:repo ./backup
  #
  # Then copy out the files you need using normal Linux commands. Once complete, unmount
  # with:
  #
  #    borg-job-borgbase umount backup
  services.borgbackup.jobs."borgbase" = {
    paths = [ 
      "/var/lib"
      "/home"
    ];
    exclude = [
      # very large paths
      "/var/lib/containers"
      "/var/lib/systemd"
      # temporary files created by cargo and `go build`
      "**/target"
      "/home/*/go/bin"
      "/home/*/go/pkg"
    ];
    repo = "d76g38ny@d76g38ny.repo.borgbase.com:repo";
    startAt = "daily";
  };
}