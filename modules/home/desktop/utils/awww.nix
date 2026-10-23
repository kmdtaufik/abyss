{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.modules.awww.enable && !config.modules.noctalia.enable) {
    services.awww = {
      enable = true;
    };
  };
}
