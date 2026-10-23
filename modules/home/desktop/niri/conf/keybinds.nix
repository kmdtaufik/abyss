{
  config,
  lib,
  ...
}: let
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
in {
  config = lib.mkIf config.modules.niri.enable {
    xdg.configFile."niri/keybinds.kdl".text = ''
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
          Alt+Tab { spawn "niri-focus-next-window"; }
          Alt+Shift+Tab { spawn "niri-focus-prev-window"; }

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
          Mod+Tab { spawn "niri-focus-next-occupied"; }
          Mod+Shift+Tab { spawn "niri-focus-prev-occupied"; }

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
