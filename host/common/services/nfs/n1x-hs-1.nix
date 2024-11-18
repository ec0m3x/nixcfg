_: {
  services.nfs.server.exports = ''
    /data *(rw,no_subtree_check,fsid=0,no_root_squash)
  '';
}
