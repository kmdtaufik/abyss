{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.niri.enable {
    xdg.configFile."niri/env.kdl".text = ''
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
    '';
  };
}
