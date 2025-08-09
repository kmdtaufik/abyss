{
  wayland.windowManager.hyprland.settings.exec-once = [
    "gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg"
    "systemctl --user enable --now hyprpolkitagent.service"
    "hyprctl setcursor Bibata-Modern-Ice 24"
    "swaync"
    "systemctl --user enable --now hypridle.service"
    "hyprpaper"
    "wl-paste --watch cliphist store"
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    #"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "xdg-run"
    "gtk.sh"
    "launch-bar"
    "restore-wallpaper"
  ];
}
