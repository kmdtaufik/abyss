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
        font-family = "JetBrainsMono Nerd Font";
        font-size = 12;
        cursor-style = "bar";
        cursor-style-blink = true;
        window-padding-x = 10;
        window-padding-y = 10;
        window-decoration = false;
        background-opacity = 0.7;
        confirm-close-surface = false;
      };
    };
    
    # Explicitly disable Stylix integration for Ghostty as per user request
    stylix.targets.ghostty.enable = false;
  };
}
