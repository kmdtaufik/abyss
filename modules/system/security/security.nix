{
  config,
  lib,
  pkgs,
  ...
}: {
  security = {
    rtkit.enable = true;
    polkit = {
      enable = true;
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (subject.active && subject.local && (
            action.id == "org.freedesktop.udisks2.filesystem-mount" ||
            action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
            action.id == "org.freedesktop.udisks2.filesystem-mount-other-system"
          )) {
            return polkit.Result.YES;
          }
        });

        polkit.addRule(function(action, subject) {
          if ( subject.isInGroup("users") && (
           action.id == "org.freedesktop.login1.reboot" ||
           action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
           action.id == "org.freedesktop.login1.power-off" ||
           action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          ))
          { return polkit.Result.YES; }
        });
      '';
    };
    pam.services.hyprlock = lib.mkIf config.systemModules.hyprland.enable {
      enableGnomeKeyring = true;
    };
  };
}
