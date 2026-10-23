{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.qt.enable {
    qt = {
      enable = true;
      platformTheme.name = "qtct";
    };
  };
}
