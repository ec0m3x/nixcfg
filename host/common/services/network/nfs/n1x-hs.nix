_: {
  services.nfs.server.exports = ''
    /data *(rw,no_subtree_check,no_root_squash)
  '';
}
