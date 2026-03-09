{pkgs, ...}: let
  google-sans-flex = pkgs.stdenvNoCC.mkDerivation {
    pname = "google-sans-flex";
    version = "1.0";

    src = ./google-sans-flex;

    dontBuild = true;

    installPhase = ''
      runHook preInstall

      # Create the standard font directory
      mkdir -p $out/share/fonts/truetype

      cp *.ttf $out/share/fonts/truetype/

      runHook postInstall
    '';

    meta = with pkgs.lib; {
      description = "Google Sans Flex ";
      license = licenses.ofl;
      platforms = platforms.all;
    };
  };
in {
  fonts.packages = with pkgs; [
    lohit-fonts.bengali
    noto-fonts
    corefonts
    font-awesome
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    fira-sans
    nerd-fonts.jetbrains-mono
    google-sans-flex
  ];
}
