{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.rofi.enable {
    programs.rofi = {
      enable = true;
    };
    xdg.configFile = {
      "rofi" = {
        source = ./config;
        recursive = true;
      };
    };
  };
}
