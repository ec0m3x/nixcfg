_: {
  # In order to mount the backup to restore files, perform the following:
  #
  #    mkdir borgbackup
  #    sudo borg-job-borgbase mount d76g38ny@d76g38ny.repo.borgbase.com:repo ./borgbackup
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
      "/var/lib/docker"
      # temporary files created by cargo and `go build`
      "**/target"
      "/home/*/go/bin"
      "/home/*/go/pkg"
    ];
    repo = "d76g38ny@d76g38ny.repo.borgbase.com:repo";
    startAt = "daily";
  };
}