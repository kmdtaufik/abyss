{
  config,
  lib,
  pkgs,
  ...
}: let
  c = config.lib.stylix.colors.withHashtag;
  useNoctalia = config.modules.noctalia.enable;
  launcherCmd =
    if useNoctalia
    then "noctalia msg panel-toggle launcher"
    else "rofi -show drun";
  volUpCmd =
    if useNoctalia
    then "noctalia msg volume-up"
    else "pactl set-sink-volume @DEFAULT_SINK@ +5%";
  volDownCmd =
    if useNoctalia
    then "noctalia msg volume-down"
    else "pactl set-sink-volume @DEFAULT_SINK@ -5%";
  volMuteCmd =
    if useNoctalia
    then "noctalia msg volume-mute"
    else "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
  brightUpCmd =
    if useNoctalia
    then "noctalia msg brightness-up"
    else "brightnessctl -q s +10%";
  brightDownCmd =
    if useNoctalia
    then "noctalia msg brightness-down"
    else "brightnessctl -q s 10%-";
  clipboardCmd =
    if useNoctalia
    then "noctalia msg panel-toggle clipboard"
    else "clipboard";
  lockCmd =
    if useNoctalia
    then "noctalia msg session lock"
    else "loginctl lock-session";
  mediaToggleCmd =
    if useNoctalia
    then "noctalia msg media toggle"
    else "playerctl play-pause";
  mediaNextCmd =
    if useNoctalia
    then "noctalia msg media next"
    else "playerctl next";
  mediaPrevCmd =
    if useNoctalia
    then "noctalia msg media previous"
    else "playerctl previous";
  screenshotAnnotateCmd =
    if useNoctalia
    then "noctalia msg screenshot-annotate"
    else "screenshot";
  screenshotFullCmd =
    if useNoctalia
    then "noctalia msg screenshot-fullscreen"
    else "screenshot-screen";

  focusNextOccupied = pkgs.writeShellScript "niri-focus-next-occupied" ''
    # Get workspaces with windows, cycle to next one
    current=$(${pkgs.niri}/bin/niri msg -j focused-window 2>/dev/null | ${pkgs.jq}/bin/jq -r '.workspace_id // empty')
    if [ -z "$current" ]; then
      current=$(${pkgs.niri}/bin/niri msg -j workspaces 2>/dev/null | ${pkgs.jq}/bin/jq -r '.[] | select(.is_focused).id // empty')
    fi
    next=$(${pkgs.niri}/bin/niri msg -j workspaces | ${pkgs.jq}/bin/jq -r --arg cur "''${current:-0}" '
      [.[] | select(.active_window_id != null)] |
      sort_by(.idx) |
      if length == 0 then empty
      else
        (map(.id) | index(($cur | tonumber)) // -1) as $i |
        if $i == -1 or $i >= length - 1 then (.[0].idx // .[0].id)
        else (.[$i + 1].idx // .[$i + 1].id)
        end
      end
    ')
    if [ -n "$next" ]; then
      ${pkgs.niri}/bin/niri msg action focus-workspace $next
    fi
  '';

  focusPrevOccupied = pkgs.writeShellScript "niri-focus-prev-occupied" ''
    # Get workspaces with windows, cycle to previous one
    current=$(${pkgs.niri}/bin/niri msg -j focused-window 2>/dev/null | ${pkgs.jq}/bin/jq -r '.workspace_id // empty')
    if [ -z "$current" ]; then
      current=$(${pkgs.niri}/bin/niri msg -j workspaces 2>/dev/null | ${pkgs.jq}/bin/jq -r '.[] | select(.is_focused).id // empty')
    fi
    prev=$(${pkgs.niri}/bin/niri msg -j workspaces | ${pkgs.jq}/bin/jq -r --arg cur "''${current:-0}" '
      [.[] | select(.active_window_id != null)] |
      sort_by(.idx) |
      if length == 0 then empty
      else
        (map(.id) | index(($cur | tonumber)) // -1) as $i |
        if $i == -1 or $i <= 0 then (.[-1].idx // .[-1].id)
        else (.[$i - 1].idx // .[$i - 1].id)
        end
      end
    ')
    if [ -n "$prev" ]; then
      ${pkgs.niri}/bin/niri msg action focus-workspace $prev
    fi
  '';

  # Cycle through windows on the CURRENT workspace only
  focusNextWindow = pkgs.writeShellScript "niri-focus-next-window" ''
    ws=$(${pkgs.niri}/bin/niri msg -j focused-window 2>/dev/null | ${pkgs.jq}/bin/jq -r '.workspace_id // empty')
    if [ -z "$ws" ]; then
      ws=$(${pkgs.niri}/bin/niri msg -j workspaces 2>/dev/null | ${pkgs.jq}/bin/jq -r '.[] | select(.is_focused).id // empty')
    fi
    if [ -z "$ws" ]; then exit 0; fi

    target=$(${pkgs.niri}/bin/niri msg -j windows | ${pkgs.jq}/bin/jq -r --argjson ws "$ws" '
      [.[] | select(.workspace_id == $ws)] |
      sort_by(.layout.pos_in_scrolling_layout[0] // 0, .layout.pos_in_scrolling_layout[1] // 0, .id) as $windows |
      if ($windows | length) <= 1 then empty
      else
        ($windows | map(.is_focused) | index(true) // -1) as $cur_idx |
        $windows[($cur_idx + 1) % ($windows | length)].id
      end
    ')
    if [ -n "$target" ]; then
      ${pkgs.niri}/bin/niri msg action focus-window --id "$target"
    fi
  '';

  focusPrevWindow = pkgs.writeShellScript "niri-focus-prev-window" ''
    ws=$(${pkgs.niri}/bin/niri msg -j focused-window 2>/dev/null | ${pkgs.jq}/bin/jq -r '.workspace_id // empty')
    if [ -z "$ws" ]; then
      ws=$(${pkgs.niri}/bin/niri msg -j workspaces 2>/dev/null | ${pkgs.jq}/bin/jq -r '.[] | select(.is_focused).id // empty')
    fi
    if [ -z "$ws" ]; then exit 0; fi

    target=$(${pkgs.niri}/bin/niri msg -j windows | ${pkgs.jq}/bin/jq -r --argjson ws "$ws" '
      [.[] | select(.workspace_id == $ws)] |
      sort_by(.layout.pos_in_scrolling_layout[0] // 0, .layout.pos_in_scrolling_layout[1] // 0, .id) as $windows |
      if ($windows | length) <= 1 then empty
      else
        ($windows | map(.is_focused) | index(true) // -1) as $cur_idx |
        $windows[($cur_idx - 1 + ($windows | length)) % ($windows | length)].id
      end
    ')
    if [ -n "$target" ]; then
      ${pkgs.niri}/bin/niri msg action focus-window --id "$target"
    fi
  '';
in {
  config = lib.mkIf config.modules.niri.enable {
    xdg.configFile."niri/config.kdl".text = ''
      // Niri Configuration (Tuned for 1366x768 & Stylix)

      include "noctalia.kdl"

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

      environment {
          XDG_CURRENT_DESKTOP "niri"
          XDG_SESSION_TYPE "wayland"
          XDG_SESSION_DESKTOP "niri"
          GDK_BACKEND "wayland,x11"
          QT_QPA_PLATFORM "wayland;xcb"
          CLUTTER_BACKEND "wayland"
          SDL_VIDEODRIVER "wayland"
          MOZ_ENABLE_WAYLAND "1"
          ELECTRON_OZONE_PLATFORM_HINT "wayland"
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

      debug {
          honor-xdg-activation-with-invalid-serial
      }

      binds {
          Mod+Shift+Slash { show-hotkey-overlay; }

          // Applications
          Mod+T { spawn "kitty"; }
          Mod+B { spawn "zen-twilight"; }
          Mod+E { spawn "nautilus"; }
          Mod+Ctrl+E { spawn "smile"; }
          Mod+A { spawn-sh "${launcherCmd}"; }
          Mod+V { spawn-sh "${clipboardCmd}"; }

          // Noctalia panels & settings
          ${lib.optionalString useNoctalia ''Mod+S { spawn-sh "noctalia msg panel-toggle control-center"; }''}
          ${lib.optionalString useNoctalia ''Mod+Comma { spawn-sh "noctalia msg settings-toggle"; }''}

          // Window switching on CURRENT workspace (Alt+Tab / Alt+Shift+Tab)
          Alt+Tab { spawn "${focusNextWindow}"; }
          Alt+Shift+Tab { spawn "${focusPrevWindow}"; }

          // Input Method (Avro Phonetic / English)
          F11 { spawn "toggle-bangla"; }
          Mod+Space { spawn "toggle-bangla"; }

          // Screenshots (Native Niri screenshot UI)
          Print { spawn-sh "${screenshotAnnotateCmd}"; }
          Ctrl+Print { spawn-sh "${screenshotFullCmd}"; }
          Alt+Print { screenshot-window; }

          // Window Management
          Mod+Q { close-window; }
          Mod+F { maximize-column; }
          Mod+Shift+F { fullscreen-window; }
          Mod+Alt+T { toggle-window-floating; }
          Mod+R { switch-preset-column-width; }
          Mod+C { center-column; }

          // Focus Navigation
          Mod+Left  { focus-column-left; }
          Mod+Right { focus-column-right; }
          Mod+Up    { focus-window-up; }
          Mod+Down  { focus-window-down; }
          Mod+H     { focus-column-left; }
          Mod+L     { focus-column-right; }
          Mod+K     { focus-window-up; }
          Mod+J     { focus-window-down; }

          // Move Columns/Windows
          Mod+Ctrl+Left  { move-column-left; }
          Mod+Ctrl+Right { move-column-right; }
          Mod+Ctrl+Up    { move-window-up; }
          Mod+Ctrl+Down  { move-window-down; }

          // Resize
          Mod+Shift+Left  { set-column-width "-10%"; }
          Mod+Shift+Right { set-column-width "+10%"; }
          Mod+Shift+Up    { set-window-height "-10%"; }
          Mod+Shift+Down  { set-window-height "+10%"; }

          // Workspaces
          Mod+1 { focus-workspace 1; }
          Mod+2 { focus-workspace 2; }
          Mod+3 { focus-workspace 3; }
          Mod+4 { focus-workspace 4; }
          Mod+5 { focus-workspace 5; }
          Mod+6 { focus-workspace 6; }
          Mod+7 { focus-workspace 7; }
          Mod+8 { focus-workspace 8; }
          Mod+9 { focus-workspace 9; }

          Mod+Shift+1 { move-column-to-workspace 1; }
          Mod+Shift+2 { move-column-to-workspace 2; }
          Mod+Shift+3 { move-column-to-workspace 3; }
          Mod+Shift+4 { move-column-to-workspace 4; }
          Mod+Shift+5 { move-column-to-workspace 5; }
          Mod+Shift+6 { move-column-to-workspace 6; }
          Mod+Shift+7 { move-column-to-workspace 7; }
          Mod+Shift+8 { move-column-to-workspace 8; }
          Mod+Shift+9 { move-column-to-workspace 9; }

          // Occupied workspace cycling (Mod+Tab / Mod+Shift+Tab)
          Mod+Tab { spawn "${focusNextOccupied}"; }
          Mod+Shift+Tab { spawn "${focusPrevOccupied}"; }

          Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
          Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
          Mod+Shift+WheelScrollDown                { focus-column-right; }
          Mod+Shift+WheelScrollUp                  { focus-column-left; }

          // Session
          Mod+Shift+E { quit; }
          Mod+Shift+P { power-off-monitors; }
          Mod+Shift+L { spawn-sh "${lockCmd}"; }

          // Audio & Brightness
          XF86AudioRaiseVolume  allow-when-locked=true { spawn-sh "${volUpCmd}"; }
          XF86AudioLowerVolume  allow-when-locked=true { spawn-sh "${volDownCmd}"; }
          XF86AudioMute         allow-when-locked=true { spawn-sh "${volMuteCmd}"; }
          XF86AudioMicMute      allow-when-locked=true { spawn-sh "pactl set-source-mute @DEFAULT_SOURCE@ toggle"; }
          XF86AudioPlay         allow-when-locked=true { spawn-sh "${mediaToggleCmd}"; }
          XF86AudioNext         allow-when-locked=true { spawn-sh "${mediaNextCmd}"; }
          XF86AudioPrev         allow-when-locked=true { spawn-sh "${mediaPrevCmd}"; }
          XF86MonBrightnessUp   allow-when-locked=true { spawn-sh "${brightUpCmd}"; }
          XF86MonBrightnessDown allow-when-locked=true { spawn-sh "${brightDownCmd}"; }
      }
    '';
  };
}
