{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
    sourceFirst = true;
    settings = {
      monitor = [
        ",preferred,auto,1"
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
          blurls = "waybar";
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

      #misc
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        initial_workspace_tracking = 1;
      };

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
    ./conf/autostart.nix
    ./conf/gestures.nix
    ./conf/env.nix
    ./conf/keybinds.nix
  ];
}
