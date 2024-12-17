_: {
  services.nfs.server.exports = ''
    /data *(rw,insecure,no_subtree_check,fsid=0,no_root_squash)
  '';
}
