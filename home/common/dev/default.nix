{ desktop, lib, ... }:
{
  imports = [
  ] ++ lib.optional (builtins.isString desktop) ./desktop.nix;

}
