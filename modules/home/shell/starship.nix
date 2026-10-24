{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.starship.enable {
    home.packages = [pkgs.starship];
  };
}
