{
  wayland.windowManager.hyprland.settings = {
    env = [
      # Wayland / XDG
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"

      # Toolkit Backends
      "GDK_BACKEND,wayland,x11"
      "CLUTTER_BACKEND,wayland"
      "SDL_VIDEODRIVER,wayland"

      # Qt
      "QT_QPA_PLATFORM,wayland;xcb"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_QPA_PLATFORMTHEME,qt6ct" # Pick one (qt6ct is preferred)
      "QT_SCALE_FACTOR,1"

      # GTK / Appearance
      "GDK_SCALE,1"
      # "XCURSOR_SIZE,24"
      # "HYPRCURSOR_SIZE,24"

      # Browser / Electron / Ozone
      "MOZ_ENABLE_WAYLAND,1"
      "ELECTRON_OZONE_PLATFORM_HINT,wayland"
    ];
  };
}
