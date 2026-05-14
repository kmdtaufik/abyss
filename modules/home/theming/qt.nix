{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.qt.enable {
    qt.enable = true;
    stylix.targets = {
      qt.enable = true;
      kde = {
        enable = true;
      };
    };
  };
}
