{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.noctalia.enable {
    programs.noctalia.settings.dock = {
      enabled = false;
      icon_size = 52;
      item_spacing = 8;
      main_axis_padding = 18;
    };
  };
}
