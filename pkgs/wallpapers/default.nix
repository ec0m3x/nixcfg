{ lib, stdenv, }:

stdenv.mkDerivation rec {
  pname = "wallpapers";
  version = "1.0";

  # The source directory with wallpapers
  src = ./.;

  buildInputs = [];

  meta = with lib; {
    description = "A collection of wallpapers for use in NixOS configuration";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };

  installPhase = ''
    mkdir -p $out/share/wallpapers
    cp -r ${./wallpapers}/* $out/share/wallpapers
  '';
}
