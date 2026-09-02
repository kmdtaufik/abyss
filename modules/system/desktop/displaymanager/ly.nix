{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.systemModules.displaymanager.ly.enable {
    services.displayManager.ly = {
      enable = true;
      settings = {
        animation = "dur";
        dur_file_path = "${./blackhole.dur}";
        clock = "%c";
        hide_borders = false;
        margin_box_h = 2;
        margin_box_v = 2;
        box_title = " Abyss ";
      };
    };
    
    security.pam.services = {
      ly.enableGnomeKeyring = true;
      login.enableGnomeKeyring = true;
    };
  };
}
