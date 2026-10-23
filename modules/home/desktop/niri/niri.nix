{
  config,
  lib,
  ...
}: let
  c = config.lib.stylix.colors.withHashtag;
in {
  config = lib.mkIf config.modules.niri.enable {
    xdg.configFile."niri/config.kdl".text = ''
      // Niri Configuration (Tuned for 1366x768 & Stylix)

      include "noctalia.kdl"
      include "env.kdl"
      include "windowrules.kdl"
      include "keybinds.kdl"

      input {
          keyboard {
              xkb {
                  layout "us"
              }
          }
          touchpad {
              tap
              natural-scroll
          }
          focus-follows-mouse max-scroll-amount="0%"
      }

      output "eDP-1" {
          scale 1.0
      }

      spawn-at-startup "fcitx5" "-d"

      layout {
          gaps 8
          center-focused-column "never"

          preset-column-widths {
              proportion 0.5
              proportion 0.85
              proportion 1.0
          }

          default-column-width { proportion 0.85; }

          focus-ring {
              width 2
              active-color "${c.base0D}"
              inactive-color "${c.base02}"
          }

          border {
              off
          }
      }

      prefer-no-csd

      screenshot-path "~/Pictures/Screenshots/screenshot_%Y-%m-%d_%H-%M-%S.png"

      animations {
          slowdown 0.8
      }

      blur {
          passes 2
          offset 3.0
          noise 0.03
          saturation 1.0
      }

      debug {
          honor-xdg-activation-with-invalid-serial
      }
    '';
  };
}
