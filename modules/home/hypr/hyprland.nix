{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
    sourceFirst = true;
    settings = {
      env = [
        "NIXOS_OZONE_WL, 1"
        "SDL_VIDEODRIVER,wayland"
        "NIXPKGS_ALLOW_UNFREE, 1"
        #No need in uwsm
        /*
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        */
        "GDK_BACKEND, wayland,x11"
        "CLUTTER_BACKEND, wayland"
        "QT_QPA_PLATFORM=wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "MOZ_ENABLE_WAYLAND, 1"
        "GDK_SCALE,1"
        "QT_SCALE_FACTOR,1"
      ];
      monitor = [
        ",preferred,auto,1"
      ];
      exec-once = [
        "hyprctl setcursor Bibata-Modern-Ice 24"
        "systemctl --user enable --now hyprpolkitagent.service"
        "swaync"
        "systemctl --user enable --now hypridle.service"
        "hyprpaper"
        "wl-paste --watch cliphist store"
        #"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "xdg-run"
        "launch-bar"
        "restore-wallpaper"
      ];
      source = [
        "~/.config/hypr/colors.conf"
      ];
      cursor = {
        no_hardware_cursors = true;
      };
      input = {
        numlock_by_default = true;
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
          scroll_factor = 1.0;
        };
        sensitivity = 0;
      };
      #Window Layout & colors
      general = {
        gaps_in = 10;
        gaps_out = 14;
        border_size = 3;
        "col.active_border" = "$on_surface";
        "col.inactive_border" = "$on_primary_fixed";
        layout = "dwindle";
        resize_on_border = true;
      };
      #Decorations
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 0.8;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 6;
          passes = 2;
          new_optimizations = "on";
          ignore_opacity = true;
          xray = true;
          # blurls = waybar
        };

        shadow = {
          enabled = true;
          range = 30;
          render_power = 3;
          color = "0x66000000";
        };
      };
      #Layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        # "new_status" = "master"; # Commented out due to compatibility reasons
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 500;
        workspace_swipe_invert = true;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = true;
        workspace_swipe_forever = true;
      };

      binds = {
        workspace_back_and_forth = true;
        allow_workspace_cycles = true;
        pass_mouse_when_bound = false;
      };
      #misc
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        initial_workspace_tracking = 1;
      };
      /*
      #window rule
      windowrule = [
        "tile,title:^(Microsoft-edge)$"
        "tile,title:^(Brave-browser)$"
        "tile,title:^(Vivaldi)$"
        "tile,title:^(Firefox)$"
        "tile,title:^(Google-chrome)$"
        "tile,title:^(Chromium)$"
        "float,title:^(pavucontrol)$"
        "float,title:^(blueman-manager)$"
        "float,title:^(nm-connection-editor)$"
        "float,title:^(qalculate-gtk)$"
        "tile,title:^(Visual-studio-code)$"
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "move 69.5% 4%, title:^(Picture-in-Picture)$"
      ];

      #layerrule
      layerrule = [
        "blur, swaync-control-center"
        "blur, swaync-notification-window"
        "ignorezero, swaync-control-center"
        "ignorezero, swaync-notification-window"
        "ignorealpha 0.5, swaync-control-center"
        "ignorealpha 0.5, swaync-notification-window"
      ];
      */
      #keybindings
      "$mainMod" = "SUPER";
      bind = [
        # Applications
        "$mainMod, T, exec, ghostty"
        "$mainMod, B, exec, vivaldi"
        "$mainMod, E, exec, nautilus"
        "$mainMod CTRL, E, exec, emojipicker"

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
        "$mainMod SHIFT, L, exec, wlogout"
        "$mainMod SHIFT, W, exec, waypaper --random"
        "$mainMod CTRL, W, exec, waypaper"
        "$mainMod, A, exec, rofi -show drun -replace -i"
        "$mainMod CTRL, K, exec, hyprland-keybinds"
        "$mainMod SHIFT, R, exec, hyprctl reload"
        "$mainMod, V, exec, clipboard"
        "$mainMod SHIFT, H, exec, hyprshade-menu"

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
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

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
      #animations
      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, once"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };
    };
  };
  imports = [
    ./conf/windowrule.nix
    /*
      ./conf/layerrule.nix
    ./conf/gestures.nix
    ./conf/binds.nix
    ./conf/bindm.nix
    ./conf/binde.nix
    */
  ];
}
