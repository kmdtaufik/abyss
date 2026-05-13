{ config, lib, ... }: {
  config = lib.mkIf config.modules.fzf.enable {
    programs.fzf.enable = true;
  };
}
