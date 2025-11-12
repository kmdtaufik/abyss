{
  wayland.windowManager.hyprland.settings = {
    binds = {
      workspace_back_and_forth = true;
      allow_workspace_cycles = true;
      pass_mouse_when_bound = false;
    };

    "$mainMod" = "SUPER";
    bind = [
      # Applications
      "$mainMod, T, exec, kitty"
      "$mainMod, B, exec, zen-twilight"
      "$mainMod, E, exec, nautilus"
      "$mainMod CTRL, E, exec, smile"

      # Windows
      "$mainMod, Q, killactive"
      "$mainMod, F, fullscreen"
      "$mainMod ALT, T, togglefloating"
      "$mainMod SHIFT, T, exec, toggle-floating" # Float all windows
      "$mainMod, J, togglesplit"
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"
      "$mainMod SHIFT, right, resizeactive, 100 0"
      "$mainMod SHIFT, left, resizeactive, -100 0"
      "$mainMod SHIFT, down, resizeactive, 0 100"
      "$mainMod SHIFT, up, resizeactive, 0 -100"
      "$mainMod, G, togglegroup"
      "$mainMod, K, swapsplit"

      # Actions
      " , PRINT, exec, screenshot"
      "$mainMod, S, exec, screenshot"
      "$mainMod,L,exec,hyprlock"
      "$mainMod SHIFT, L, exec, wlogout"
      "$mainMod SHIFT, W, exec, waypaper --random"
      "$mainMod CTRL, W, exec, waypaper"
      "$mainMod, A, exec, walker --height 300"
      "$mainMod, ?, exec, hyprland-keybinds"
      "$mainMod SHIFT, R, exec, hyprctl reload"
      "$mainMod, V, exec,walker -m clipboard --height 300"

      # Workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      # "$mainMod, 0, workspace, 10"
      "$mainMod,0 ,togglespecialworkspace," #move to specific workspace

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      # "$mainMod SHIFT, 0, movetoworkspace, 10"
      "$mainMod SHIFT, 0, movetoworkspacesilent, special"

      "$mainMod, Tab, workspace, m+1"
      "$mainMod SHIFT, Tab, workspace, m-1"

      "$mainMod CTRL, 1, exec, moveTo 1"
      "$mainMod CTRL, 2, exec, moveTo 2"
      "$mainMod CTRL, 3, exec, moveTo 3"
      "$mainMod CTRL, 4, exec, moveTo 4"
      "$mainMod CTRL, 5, exec, moveTo 5"
      "$mainMod CTRL, 6, exec, moveTo 6"
      "$mainMod CTRL, 7, exec, moveTo 7"
      "$mainMod CTRL, 8, exec, moveTo 8"
      "$mainMod CTRL, 9, exec, moveTo 9"
      "$mainMod CTRL, 0, exec, moveTo 10"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
      "$mainMod CTRL, down, workspace, empty"

      # Fn keys
      ", XF86MonBrightnessUp, exec, brightnessctl -q s +10%"
      ", XF86MonBrightnessDown, exec, brightnessctl -q s 10%-"
      ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
      ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
      # ", XF86Calculator, exec, ~/.config/ml4w/settings/calculator.sh"
      ", XF86Lock, exec, hyprlock"

      ", code:238, exec, brightnessctl -d smc::kbd_backlight s +10"
      ", code:237, exec, brightnessctl -d smc::kbd_backlight s 10-"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
    binde = [
      "ALT, Tab, cyclenext"
      "ALT, Tab, bringactivetotop"
    ];
  };
}
