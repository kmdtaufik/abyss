{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.qutebrowser.enable {
    programs.qutebrowser = {
      enable = true;
    };
    stylix.targets.qutebrowser.enable = true;
  };
}
