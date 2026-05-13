{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.qute-browser.enable {
    programs.qutebrowser = {
      enable = true;
      package = pkgs.qutebrowser-qt5;
    };
  };
}
