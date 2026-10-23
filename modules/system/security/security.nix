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
          if (action.id.indexOf("org.freedesktop.udisks2.") == 0 && subject.active && subject.local) {
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
