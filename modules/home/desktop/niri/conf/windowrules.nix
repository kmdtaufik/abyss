{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.niri.enable {
    xdg.configFile."niri/windowrules.kdl".text = ''
      window-rule {
          geometry-corner-radius 12
          clip-to-geometry true
      }

      window-rule {
          background-effect {
              blur true
              xray true
          }
      }

      window-rule {
          match app-id="dev.noctalia.Noctalia"
          open-floating true
          default-column-width { fixed 1000; }
          default-window-height { fixed 700; }
      }

      window-rule {
          match app-id="org.pulseaudio.pavucontrol"
          open-floating true
          default-column-width { fixed 700; }
          default-window-height { fixed 600; }
      }

      window-rule {
          match app-id="io.missioncenter.MissionCenter"
          open-floating true
          default-column-width { fixed 900; }
          default-window-height { fixed 600; }
      }

      window-rule {
          match app-id="it.mijorus.smile"
          open-floating true
      }

      window-rule {
          match app-id="com.obsproject.Studio" title="(?i)(settings|remux)"
          open-floating true
      }

      window-rule {
          match app-id="blueman-manager"
          open-floating true
      }

      window-rule {
          match app-id="nwg-displays"
          open-floating true
          default-column-width { fixed 1000; }
          default-window-height { fixed 600; }
      }

      layer-rule {
          match namespace="^noctalia-backdrop"
          place-within-backdrop true
      }

      layer-rule {
          match namespace="^noctalia-(panel|attached-panel|notification|osd)$"
          background-effect {
              xray false
          }
      }

      layer-rule {
          match namespace="noctalia-window-switcher"
          background-effect {
              blur true
              xray false
          }
      }
    '';
  };
}
