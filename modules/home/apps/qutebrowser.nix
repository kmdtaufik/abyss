{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.qutebrowser.enable {
    programs.qutebrowser = {
      enable = true;
      package = pkgs.qutebrowser-qt5;
    };
  };
}
