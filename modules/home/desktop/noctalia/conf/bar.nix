{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.noctalia.enable {
    programs.noctalia.settings.bar = {
      order = lib.mkForce ["default"];
      default = {
        position = "top";
        thickness = 36;
        padding = 14;
        widget_spacing = 8;
        font_weight = 500;
        margin_ends = 0;
        margin_edge = 0;
        radius = 0;
        start = [
          "launcher"
          "wallpaper"
          "workspaces"
        ];
        center = [
          "clock"
        ];
        end = [
          "tray"
          "notifications"
          "clipboard"
          "network"
          "bluetooth"
          "volume"
          "brightness"
          "battery"
          "control-center"
          "session"
        ];
      };
    };
  };
}
