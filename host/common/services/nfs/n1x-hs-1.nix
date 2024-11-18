_: {
  services.nfs.server.exports = ''
    /home/ecomex/data  10.20.50.0/24 (rw,fsid=0,no_subtree_check)
  '';
}
