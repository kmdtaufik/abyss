{ config, lib, ... }: {
  config = lib.mkIf config.modules.obsidian.enable {
    programs.obsidian.enable = true;
  };
}
