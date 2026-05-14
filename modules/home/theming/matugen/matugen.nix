{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.matugen.enable {
    home.packages = with pkgs; [matugen];
    xdg.configFile."matugen" = {
      source = ./config;
      recursive = true;
    };
  };
}
