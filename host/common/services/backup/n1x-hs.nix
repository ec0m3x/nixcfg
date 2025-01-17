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
      "/data"
      "/var/lib"
      "/home"
    ];
    exclude = [
      # very large paths
      "/data/tm_share"
      "/var/lib/containers"
      "/var/lib/systemd"
      # temporary files created by cargo and `go build`
      "**/target"
      "/home/*/go/bin"
      "/home/*/go/pkg"
    ];
    repo = "clb1477x@clb1477x.repo.borgbase.com:repo";
    startAt = "daily";
  };
}