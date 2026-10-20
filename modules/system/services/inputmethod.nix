{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.systemModules.inputMethod.enable {
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-openbangla-keyboard
          fcitx5-gtk
          kdePackages.fcitx5-configtool
        ];
        settings = {
          globalOptions = {
            "Hotkey" = {
              "EnumerateWithTriggerKeys" = "True";
              "EnumerateSkipFirst" = "False";
            };
            "Hotkey/TriggerKeys" = {
              "0" = "Control+space";
              "1" = "Super+space";
            };
            "Behavior" = {
              "ShareInputState" = "All";
            };
          };
          inputMethod = {
            "Groups/0" = {
              "Name" = "Default";
              "Default Layout" = "us";
              "DefaultIM" = "keyboard-us";
            };
            "Groups/0/Items/0" = {
              "Name" = "keyboard-us";
              "Layout" = "";
            };
            "Groups/0/Items/1" = {
              "Name" = "openbangla";
              "Layout" = "";
            };
            "GroupOrder" = {
              "0" = "Default";
            };
          };
        };
      };
    };

    environment.systemPackages = with pkgs; [
      openbangla-keyboard
    ];
  };
}
