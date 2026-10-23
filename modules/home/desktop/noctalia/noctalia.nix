{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];
  config = lib.mkIf config.modules.noctalia.enable {
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
      checkConfig = true;

      settings = {
        # Use wallpaper-derived Material Design 3 colors
        theme = {
          source = "wallpaper";
          wallpaper_scheme = "m3-tonal-spot";
          mode = "dark";
          templates = {
            enable_builtin_templates = true;
            enable_community_templates = false;
            builtin_ids = [
              "alacritty"
              "btop"
              "foot"
              "ghostty"
              "gtk3"
              "gtk4"
              "niri"
              "qt"
            ];
            community_ids = [];
            user = {
              kitty = {
                input_path = "${config.programs.noctalia.package}/share/noctalia/assets/templates/kitty/kitty.conf";
                output_path = "$XDG_CONFIG_HOME/kitty/themes/noctalia.conf";
                post_hook = "pkill -USR1 kitty || true";
              };
            };
          };
        };

        # Shell sizing — generous for 1366x768 display
        bar.default = {
          thickness = 42; # was 34, cramped
          padding = 16; # was 14
          widget_spacing = 8; # was 6
          font_weight = 500;
        };

        dock = {
          icon_size = 52; # was 48, a bit small
          item_spacing = 8; # was 6
          main_axis_padding = 18; # was 16
        };

        # Accessibility
        accessibility.ui_scale = 1.1; # slight scale up for 768px

        # Shell panel preferences
        shell.panel = {
          transparency_mode = "glass";
          launcher_placement = "attached";
        };

        # Wallpaper — the dynamic wallpaper flow (`wallpaper` script) owns this path
        wallpaper.default.path = "${config.home.homeDirectory}/.config/abyss/.cache/current_wallpaper.png";
      };
    };

    # Ensure placeholder theme files exist so applications can start cleanly
    # before the first Noctalia template generation pass runs.
    home.activation.noctaliaThemePlaceholders = lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p "$HOME/.config/niri" \
               "$HOME/.config/foot/themes" \
               "$HOME/.config/alacritty/themes" \
               "$HOME/.config/ghostty/themes" \
               "$HOME/.config/kitty/themes" \
               "$HOME/.config/btop/themes"

      [ -f "$HOME/.config/niri/noctalia.kdl" ] || touch "$HOME/.config/niri/noctalia.kdl"
      [ -f "$HOME/.config/foot/themes/noctalia" ] || touch "$HOME/.config/foot/themes/noctalia"
      [ -f "$HOME/.config/alacritty/themes/noctalia.toml" ] || touch "$HOME/.config/alacritty/themes/noctalia.toml"
      [ -f "$HOME/.config/ghostty/themes/noctalia" ] || touch "$HOME/.config/ghostty/themes/noctalia"
      [ -f "$HOME/.config/kitty/themes/noctalia.conf" ] || touch "$HOME/.config/kitty/themes/noctalia.conf"
      [ -f "$HOME/.config/btop/themes/noctalia.theme" ] || touch "$HOME/.config/btop/themes/noctalia.theme"
    '';
  };
}
