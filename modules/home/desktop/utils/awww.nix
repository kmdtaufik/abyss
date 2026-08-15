{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.awww.enable {
    services.awww = {
      enable = true;
    };
  };
}
