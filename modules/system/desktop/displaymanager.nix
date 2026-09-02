{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit
    (import ../../../settings.nix)
    theKBDVariant
    theKBDLayout
    theSecondKBDLayout
    ;
in {
  config = lib.mkIf config.systemModules.displaymanager.enable (lib.mkMerge [
    {
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
    }

    (lib.mkIf config.systemModules.displaymanager.sddm.enable {
      services.displayManager.sddm = {
        package = pkgs.kdePackages.sddm;
        extraPackages = with pkgs; [sddm-astronaut];
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
        theme = "sddm-astronaut-theme";
      };
      
      #enable gnome keyring for sddm
      security.pam.services = {
        sddm.enableGnomeKeyring = true;
        login.enableGnomeKeyring = true;
      };
      
      environment.systemPackages = let
        sddm-astronaut = pkgs.sddm-astronaut.override {
          embeddedTheme = "japanese_aesthetic";
        };
      in [
        sddm-astronaut
      ];
    })

    (lib.mkIf config.systemModules.displaymanager.ly.enable {
      services.displayManager.ly.enable = true;
    })
  ]);
}
