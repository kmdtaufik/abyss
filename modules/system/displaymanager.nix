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
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "tokyo-night-sddm";
    };
  };

  environment.systemPackages = let
    tokyo-night = pkgs.libsForQt5.callPackage ./sddm-tokyo-night.nix {};
  in [
    tokyo-night # Name: tokyo-night-sddm
    pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];
}
