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
          include = "~/.config/foot/themes/noctalia";
          pad = "10x10";
        };
        cursor = {
          style = "beam";
          blink = "yes";
        };
        colors = {
          alpha = 0.7;
        };
        colors-dark = {
          alpha-mode = "matching";
        };
      };
    };
  };
}
