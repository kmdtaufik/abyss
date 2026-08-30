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
          pad = "10x10";
        };
        cursor = {
          style = "beam";
          blink = "yes";
        };
        colors-dark = {
          alpha-mode = "all";
        };
      };
    };

    stylix.targets.foot.enable = true;
  };
}
