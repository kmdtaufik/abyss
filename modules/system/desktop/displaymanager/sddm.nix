{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf config.systemModules.displaymanager.sddm.enable {
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
  };
}
