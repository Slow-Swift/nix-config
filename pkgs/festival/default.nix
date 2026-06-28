{
  lib,
  stdenv,
  gcc13Stdenv,
  speech-tools,
  fetchurl,
  ncurses,
  libX11,
  libXt,
  libXext,
  audiofile,
  alsa-lib,
  makeWrapper
}:

gcc13Stdenv.mkDerivation rec {
  pname = "festival";
  version = "2.4";

  src = fetchurl {
    url = "https://www.cstr.ed.ac.uk/downloads/festival/2.4/festival-${version}-release.tar.gz";
    sha256 = "sha256-Hkfyk+CFf/3ivM6tl5R8BA6gs16hLdV5bttRWD5eXYQ=";
  };

  nativeBuildInputs = [ makeWrapper ];

  buildInputs = [
    speech-tools
    ncurses
    libX11
    libXt
    libXext
    audiofile
    alsa-lib
  ];

  preConfigure = ''
    export SYSTEM_TYPE=Linux
  '';

  meta = with lib; {
    description = "Festival speech synthesis system";
    homepage = "https://www.cstr.ed.ac.uk/projects/festival";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
