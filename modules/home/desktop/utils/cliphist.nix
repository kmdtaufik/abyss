{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.cliphist.enable {
    services.cliphist = {
      enable = true;
      package = pkgs.cliphist;
      allowImages = true;
      clipboardPackage = pkgs.wl-clipboard;
    };
  };
}
