{
  config,
  lib,
  ...
}: let
  inherit
    (import ../../../../settings.nix)
    theKBDVariant
    theKBDLayout
    theSecondKBDLayout
    ;
in {
  imports = [
    ./sddm.nix
    ./ly.nix
  ];

  config = lib.mkIf config.systemModules.displaymanager.enable {
    services = {
      xserver.enable = true;
      xserver.xkb = {
        variant = "${theKBDVariant}";
        layout = "${theKBDLayout}, ${theSecondKBDLayout}";
      };
      libinput.enable = true;
    };

    assertions = [
      {
        assertion = !(config.systemModules.displaymanager.sddm.enable && config.systemModules.displaymanager.ly.enable);
        message = "You cannot enable multiple display managers at the same time (SDDM and Ly).";
      }
    ];
  };
}
