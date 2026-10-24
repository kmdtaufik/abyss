{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.stylix.enable {
    stylix = {
      autoEnable = false;
      targets = {
        fcitx5.enable = false;
        rofi.enable = false;
        waybar.enable = config.modules.waybar.enable;
        swaync.enable = config.modules.swaync.enable;
      };
      opacity = {
        terminal = 0.7;
      };
    };

    xdg.dataFile."fcitx5/themes/stylix/theme.conf".text = let
      c = config.lib.stylix.colors.withHashtag;
    in ''
      [Metadata]
      Name=stylix
      Version=1.0
      Author=Stylix
      Description=Stylix System Theme for Fcitx5
      ScaleWithDPI=True

      [InputPanel]
      Font="${config.stylix.fonts.sansSerif.name} 12"
      NormalColor=${c.base05}
      HighlightCandidateColor=${c.base00}
      HighlightColor=${c.base0D}
      HighlightBackgroundColor=${c.base00}
      Spacing=4

      [InputPanel/TextMargin]
      Left=10
      Right=10
      Top=6
      Bottom=6

      [InputPanel/Background]
      Color=${c.base00}
      BorderColor=${c.base0D}
      BorderWidth=2

      [InputPanel/Background/Margin]
      Left=2
      Right=2
      Top=2
      Bottom=2

      [InputPanel/Highlight]
      Color=${c.base0D}

      [InputPanel/Highlight/Margin]
      Left=8
      Right=8
      Top=5
      Bottom=5

      [Menu/Background]
      Color=${c.base01}

      [Menu/Background/Margin]
      Left=2
      Right=2
      Top=2
      Bottom=2

      [Menu/ContentMargin]
      Left=2
      Right=2
      Top=2
      Bottom=2

      [Menu/Highlight]
      Color=${c.base0D}

      [Menu/Highlight/Margin]
      Left=8
      Right=8
      Top=5
      Bottom=5

      [Menu/Separator]
      Color=${c.base03}

      [Menu/TextMargin]
      Left=5
      Right=5
      Top=5
      Bottom=5
    '';

    xdg.configFile."fcitx5/conf/classicui.conf".text = ''
      # Vertical Candidate List
      Vertical Candidate List=False
      # Use Per Screen DPI
      PerScreenDPI=True
      # Font
      Font="${config.stylix.fonts.sansSerif.name} 12"
      # Theme
      Theme=stylix
      # Dark Theme
      DarkTheme=stylix
      # Use Dark Theme
      UseDarkTheme=True
    '';

    xdg.configFile."fcitx5/config".text = ''
      [Hotkey]
      EnumerateWithTriggerKeys=True
      EnumerateSkipFirst=False

      [Hotkey/TriggerKeys]
      0=Control+space

      [Behavior]
      ShareInputState=All
    '';
  };
}
