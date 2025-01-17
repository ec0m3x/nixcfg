{ pkgs, ... }:
let
  inherit (pkgs)
    buildGoModule
    cacert
    caddy
    go
    lib
    stdenv
    xcaddy
    ;
in
caddy.override {
  buildGoModule =
    args:
    buildGoModule (
      args
      // {
        src = stdenv.mkDerivation rec {
          pname = "caddy-using-xcaddy-${xcaddy.version}";
          inherit (caddy) version;

          dontUnpack = true;
          dontFixup = true;

          nativeBuildInputs = [
            cacert
            go
          ];

          plugins = [ "github.com/caddy-dns/cloudflare" ];

          configurePhase = ''
            export GOCACHE=$TMPDIR/go-cache
            export GOPATH="$TMPDIR/go"
            export XCADDY_SKIP_BUILD=1
          '';

          buildPhase = ''
            ${xcaddy}/bin/xcaddy build "${caddy.src.rev}" ${
              lib.concatMapStringsSep " " (plugin: "--with ${plugin}") plugins
            }
            cd buildenv*
            go mod vendor
          '';

          installPhase = ''
            cp -r --reflink=auto . $out
          '';

          outputHash = "sha256-Aqu2st8blQr/Ekia2KrH1AP/2BVZIN4jOJpdLc1Rr4g=";
          outputHashMode = "recursive";
        };

        subPackages = [ "." ];
        ldflags = [
          "-s"
          "-w"
        ]; # # don't include version info twice
        vendorHash = null;
      }
    );
}
