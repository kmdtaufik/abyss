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
    programs.niri.settings.binds = {
      "Mod+Shift+Slash".action.show-hotkey-overlay = [];

      # Applications
      "Mod+T".action.spawn = "kitty";
      "Mod+B".action.spawn = "zen-twilight";
      "Mod+E".action.spawn = "nautilus";
      "Mod+Ctrl+E".action.spawn = "smile";
      "Mod+A".action.spawn-sh = launcherCmd;
      "Mod+V".action.spawn-sh = clipboardCmd;

      # Window switching on CURRENT workspace (Alt+Tab / Alt+Shift+Tab)
      "Alt+Tab".action.spawn = "niri-focus-next-window";
      "Alt+Shift+Tab".action.spawn = "niri-focus-prev-window";

      # Input Method (Avro Phonetic / English)
      "F11".action.spawn = "toggle-bangla";
      "Mod+Space".action.spawn = "toggle-bangla";

      # Screenshots (Native Niri screenshot UI)
      "Print".action.spawn-sh = screenshotAnnotateCmd;
      "Ctrl+Print".action.spawn-sh = screenshotFullCmd;
      "Alt+Print".action.screenshot-window = [];

      # Window Management
      "Mod+Q".action.close-window = [];
      "Mod+F".action.maximize-column = [];
      "Mod+Shift+F".action.fullscreen-window = [];
      "Mod+Alt+T".action.toggle-window-floating = [];
      "Mod+R".action.switch-preset-column-width = [];
      "Mod+C".action.center-column = [];

      # Focus Navigation
      "Mod+Left".action.focus-column-left = [];
      "Mod+Right".action.focus-column-right = [];
      "Mod+Up".action.focus-window-up = [];
      "Mod+Down".action.focus-window-down = [];
      "Mod+H".action.focus-column-left = [];
      "Mod+L".action.focus-column-right = [];
      "Mod+K".action.focus-window-up = [];
      "Mod+J".action.focus-window-down = [];

      # Move Columns/Windows
      "Mod+Ctrl+Left".action.move-column-left = [];
      "Mod+Ctrl+Right".action.move-column-right = [];
      "Mod+Ctrl+Up".action.move-window-up = [];
      "Mod+Ctrl+Down".action.move-window-down = [];

      # Resize
      "Mod+Shift+Left".action.set-column-width = "-10%";
      "Mod+Shift+Right".action.set-column-width = "+10%";
      "Mod+Shift+Up".action.set-window-height = "-10%";
      "Mod+Shift+Down".action.set-window-height = "+10%";

      # Workspaces
      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;

      "Mod+Shift+1".action.move-column-to-workspace = 1;
      "Mod+Shift+2".action.move-column-to-workspace = 2;
      "Mod+Shift+3".action.move-column-to-workspace = 3;
      "Mod+Shift+4".action.move-column-to-workspace = 4;
      "Mod+Shift+5".action.move-column-to-workspace = 5;
      "Mod+Shift+6".action.move-column-to-workspace = 6;
      "Mod+Shift+7".action.move-column-to-workspace = 7;
      "Mod+Shift+8".action.move-column-to-workspace = 8;
      "Mod+Shift+9".action.move-column-to-workspace = 9;

      # Occupied workspace cycling (Mod+Tab / Mod+Shift+Tab)
      "Mod+Tab".action.spawn = "niri-focus-next-occupied";
      "Mod+Shift+Tab".action.spawn = "niri-focus-prev-occupied";

      "Mod+WheelScrollDown" = {
        cooldown-ms = 150;
        action.focus-workspace-down = [];
      };
      "Mod+WheelScrollUp" = {
        cooldown-ms = 150;
        action.focus-workspace-up = [];
      };
      "Mod+Shift+WheelScrollDown".action.focus-column-right = [];
      "Mod+Shift+WheelScrollUp".action.focus-column-left = [];

      # Session
      "Mod+Shift+E".action.quit = [];
      "Mod+Shift+P".action.power-off-monitors = [];
      "Mod+Shift+L".action.spawn-sh = lockCmd;

      # Audio & Brightness
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action.spawn-sh = volUpCmd;
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn-sh = volDownCmd;
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action.spawn-sh = volMuteCmd;
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action.spawn-sh = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
      };
      "XF86AudioPlay" = {
        allow-when-locked = true;
        action.spawn-sh = mediaToggleCmd;
      };
      "XF86AudioNext" = {
        allow-when-locked = true;
        action.spawn-sh = mediaNextCmd;
      };
      "XF86AudioPrev" = {
        allow-when-locked = true;
        action.spawn-sh = mediaPrevCmd;
      };
      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action.spawn-sh = brightUpCmd;
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action.spawn-sh = brightDownCmd;
      };
    } // lib.optionalAttrs useNoctalia {
      # Noctalia panels & settings
      "Mod+S".action.spawn-sh = "noctalia msg panel-toggle control-center";
      "Mod+Comma".action.spawn-sh = "noctalia msg settings-toggle";
    };
  };
}
