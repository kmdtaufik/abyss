{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.pywal.enable {
    programs.pywal.enable = false;

    #Templates config
    xdg.configFile = {
      "wal/templates" = {
        enable = false;
        source = ./templates;
        recursive = true;
      };
    };
  };
}
