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
      "/var/lib/containers"
      "/var/lib/systemd"
      "/var/lib/docker"
      "/home/*/containers/ollama"
      "/home/*/containers/invokeai"
      "/home/*/.steam*"
      "/home/*/nfs"
      "/home/*/.local"
      "/home/*/downloads"
      # temporary files created by cargo and `go build`
      "**/target"
      "/home/*/go/bin"
      "/home/*/go/pkg"
      "/home/*/.cache"
    ];
    repo = "e41pvpss@e41pvpss.repo.borgbase.com:repo";
    startAt = "*-*-* 12:00:00";
  };
}