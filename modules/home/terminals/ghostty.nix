{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.ghostty.enable {
    programs.ghostty = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      settings = {
        window-theme = "ghostty";
        cursor-style = "bar";
        cursor-style-blink = true;
        window-padding-x = 10;
        window-padding-y = 10;
        window-decoration = false;
        confirm-close-surface = false;
      };
    };

    stylix.targets.ghostty.enable = true;
  };
}
