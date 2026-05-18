{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.systemModules.throne.enable {
    programs.throne = {
      enable = true;
      tunMode = {
        enable = true;
      };
    };
  };
}
