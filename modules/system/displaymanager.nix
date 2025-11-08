{
  pkgs,
  config,
  ...
}: let
  inherit
    (import ../../settings.nix)
    theKBDVariant
    theKBDLayout
    theSecondKBDLayout
    ;
in {
  services = {
    xserver.enable = true;
    xserver.xkb = {
      variant = "${theKBDVariant}";
      layout = "${theKBDLayout}, ${theSecondKBDLayout}";
    };
    libinput.enable = true;
    displayManager.sddm = {
      package = pkgs.kdePackages.sddm;
      extraPackages= with pkgs;[ sddm-astronaut ];
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "sddm-astronaut-theme";
    };
  };

  environment.systemPackages = let
sddm-astronaut= pkgs.sddm-astronaut.override{
    embeddedTheme = "japanese_aesthetic";
  };
  in  [
  sddm-astronaut
  ];
}
