{ lib, pkgs
, stdenvNoCC
}:
stdenvNoCC.mkDerivation rec {
  pname = "sddm-sequoia";
  version = "1.0";
  # dontBuild = true;
  src = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "minMelody";
    repo = "sddm-sequoia";
    rev = "0d623afdfb0eba718c8eb3ba7f846d04463b5699";
    hash = "sha256-k177KL2u41CMexHwgdIkoTr8JokkX/e5XLlR8TQOjWk=";
  };  
  
  dontWrapQtApps = true;

  propagatedBuildInputs =with pkgs.kdePackages; [    
    qtbase
    qtsvg
    # qtgraphicaleffects
    # qtquickcontrols2
    qtdeclarative
    qt5compat
   ];
  
  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src $out/share/sddm/themes/sequoia
  '';
}
