{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.hyprland.enable {
    services.hyprpolkitagent.enable = true;
  };
}
