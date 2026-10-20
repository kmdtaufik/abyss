{pkgs, ...}: let
  google-sans-flex = pkgs.stdenvNoCC.mkDerivation {
    pname = "google-sans-flex";
    version = "1.0";
    src = ./google-sans-flex;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      cp *.ttf $out/share/fonts/truetype/
    '';
    meta = with pkgs.lib; {
      description = "Google Sans Flex ";
      license = licenses.ofl;
      platforms = platforms.all;
    };
  };
  bangla-fonts = pkgs.stdenvNoCC.mkDerivation {
    pname = "bangla-fonts";
    version = "1.0";
    src = pkgs.fetchzip {
      url = "https://github.com/hmoazzem/bangla-fonts/archive/master.tar.gz";
      hash = "sha256-748ek66M/OXxzzuKP/ypWRpWvac15UAj0Nbg8KGdE6g=";
    };
    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      cp *.ttf $out/share/fonts/truetype/
    '';
    meta = with pkgs.lib; {
      description = "Bangla Unicode fonts (Kalpurush, SolaimanLipi, Siyam Rupali, Nikosh)";
      platforms = platforms.all;
    };
  };
in {
  fonts.packages = with pkgs;
    [
      bangla-fonts
      noto-fonts
      corefonts
      font-awesome
      fira-sans
      google-sans-flex
      material-design-icons
      roboto
    ] #Nerd-fonts
    ++ (with pkgs.nerd-fonts; [
      fira-code
      fira-mono
      jetbrains-mono
    ]);
}
