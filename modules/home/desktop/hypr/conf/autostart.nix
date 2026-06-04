{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings.exec-once = [
      "restore-wallpaper"
      "launch-bar"
      "elephant"
    ];
  };
}
