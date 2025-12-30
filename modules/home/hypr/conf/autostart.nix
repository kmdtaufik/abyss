{
  wayland.windowManager.hyprland.settings.exec-once = [
    "hyprctl setcursor Bibata-Modern-Ice 24"
    "swaync"
    "elephant"
    "systemctl --user enable --now hypridle.service"
    "hyprpaper"
    "wl-paste --watch cliphist store"
    "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    # "xdg-run"
    "gtk.sh"
    "launch-bar"
    "restore-wallpaper"
  ];
}
