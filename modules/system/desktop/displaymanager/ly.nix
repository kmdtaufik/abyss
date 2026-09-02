{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.systemModules.displaymanager.ly.enable {
    services.displayManager.ly = {
      enable = true;
      # Configure some Ly-specific settings
      settings = {
        animation = "doom"; # classic doom fire animation
        hide_borders = true;
        clock = null;
      };
    };
  };
}
