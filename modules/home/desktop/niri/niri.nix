{
  config,
  lib,
  ...
}: let
  c = config.lib.stylix.colors.withHashtag;
in {
  config = lib.mkIf config.modules.niri.enable {
    programs.niri.settings = {
      includes = [
        (config.lib.niri.include.optional "noctalia.kdl")
      ];

      input = {
        keyboard = {
          xkb.layout = "us";
          numlock = true;
        };
        touchpad = {
          tap = true;
          natural-scroll = true;
        };
        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "0%";
        };
      };

      outputs."eDP-1" = {
        scale = 1.0;
      };

      spawn-at-startup = [
        { argv = [ "fcitx5" "-d" ]; }
      ];

      layout = {
        gaps = 8;
        center-focused-column = "never";

        preset-column-widths = [
          { proportion = 0.5; }
          { proportion = 0.85; }
          { proportion = 1.0; }
        ];

        default-column-width = { proportion = 0.85; };

        focus-ring.enable = false;

        border = {
          enable = true;
          width = 2;
          active.color = c.base0D;
          inactive.color = c.base02;
        };
      };

      prefer-no-csd = true;

      screenshot-path = "~/Pictures/Screenshots/screenshot_%Y-%m-%d_%H-%M-%S.png";

      animations = {
        slowdown = 0.8;
      };

      blur = {
        passes = 2;
        offset = 3.0;
        noise = 0.03;
        saturation = 1.0;
      };

      debug = {
        honor-xdg-activation-with-invalid-serial = [];
      };
    };
  };
}
