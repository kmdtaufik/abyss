{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.noctalia.enable {
    programs.noctalia.settings.shell.panel = {
      transparency_mode = "glass";
      launcher_placement = "attached";
    };
  };
}
