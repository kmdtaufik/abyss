{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.noctalia.enable {
    programs.noctalia.settings.bar = {
      default = {
        enabled = false;
      };
      order = ["main"];
      main = {
        thickness = 42;
        padding = 16;
        widget_spacing = 8;
        font_weight = 500;
        margin_ends = 0;
        margin_edge = 0;
        radius = 0;
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
