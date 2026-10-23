{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.systemModules.niri.enable {
    programs.niri.enable = true;

    # niri-flake provides polkit, portals, gnome-keyring, dconf.
    # xwayland-satellite is still needed on PATH for X11 app support.
    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
