{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings.exec-once = [
      "elephant"
      "launch-bar"
      "restore-wallpaper"
    ];
  };
}
