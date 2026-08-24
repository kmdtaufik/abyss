{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.foot.enable {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "JetBrainsMono Nerd Font:size=12";
          pad = "10x10";
        };
        colors = {
          alpha = 0.7;
        };
        cursor = {
          style = "beam";
          blink = "yes";
        };
      };
    };
    
    # Explicitly disable Stylix integration for Foot as per user request
    stylix.targets.foot.enable = false;
  };
}
