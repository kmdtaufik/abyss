{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.niri.enable {
    programs.niri.settings = {
      window-rules = [
        {
          geometry-corner-radius = let
            r = 12.0;
          in {
            top-left = r;
            top-right = r;
            bottom-right = r;
            bottom-left = r;
          };
          clip-to-geometry = true;
          draw-border-with-background = false;
        }
        {
          matches = [{ app-id = "^(kitty|Alacritty|com\\.mitchellh\\.ghostty|foot)$"; }];
          background-effect = {
            blur = true;
            xray = false;
          };
        }
        {
          matches = [{ app-id = "dev.noctalia.Noctalia"; }];
          open-floating = true;
          default-column-width = { fixed = 1000; };
          default-window-height = { fixed = 700; };
        }
        {
          matches = [{ app-id = "org.pulseaudio.pavucontrol"; }];
          open-floating = true;
          default-column-width = { fixed = 700; };
          default-window-height = { fixed = 600; };
        }
        {
          matches = [{ app-id = "io.missioncenter.MissionCenter"; }];
          open-floating = true;
          default-column-width = { fixed = 900; };
          default-window-height = { fixed = 600; };
        }
        {
          matches = [{ app-id = "it.mijorus.smile"; }];
          open-floating = true;
        }
        {
          matches = [{
            app-id = "com.obsproject.Studio";
            title = "(?i)(settings|remux)";
          }];
          open-floating = true;
        }
        {
          matches = [{ app-id = "blueman-manager"; }];
          open-floating = true;
        }
        {
          matches = [{ app-id = "nwg-displays"; }];
          open-floating = true;
          default-column-width = { fixed = 1000; };
          default-window-height = { fixed = 600; };
        }
      ];

      layer-rules = [
        {
          matches = [{ namespace = "^noctalia-backdrop"; }];
          place-within-backdrop = true;
        }
        {
          matches = [{ namespace = "^noctalia-(panel|attached-panel|notification|osd)$"; }];
          background-effect = {
            xray = false;
          };
        }
        {
          matches = [{ namespace = "noctalia-window-switcher"; }];
          background-effect = {
            blur = true;
            xray = false;
          };
        }
      ];
    };
  };
}
