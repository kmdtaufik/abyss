{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.modules.stylix.enable {
    })
    {
      xdg.configFile."fcitx5/conf/classicui.conf".text = ''
        # Vertical Candidate List
        Vertical Candidate List=False
        # Use Per Screen DPI
        PerScreenDPI=True
        # Font
        Font="Google Sans Flex 12"
        # Theme
        Theme=noctalia
        # Dark Theme
        DarkTheme=noctalia
        # Use Dark Theme
        UseDarkTheme=True
      '';

      xdg.configFile."fcitx5/config".text = ''
        [Hotkey]
        EnumerateWithTriggerKeys=True
        EnumerateSkipFirst=False

        [Hotkey/TriggerKeys]
        0=Control+space
        1=Super+space

        [Behavior]
        ShareInputState=All
      '';
    }
  ];
}
