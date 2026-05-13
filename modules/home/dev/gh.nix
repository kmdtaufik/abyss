{ config, lib, ... }: {
  config = lib.mkIf config.modules.gh.enable {
    programs.gh.enable = true;
  };
}
