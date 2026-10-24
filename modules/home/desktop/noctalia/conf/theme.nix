{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.noctalia.enable {
    programs.noctalia.settings = {
      # Use wallpaper-derived Material Design 3 colors
      theme = {
        source = "wallpaper";
        wallpaper_scheme = "m3-monochrome";
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
            rofi = {
              input_path = "${config.xdg.configHome}/noctalia/templates/rofi.rasi";
              output_path = "$XDG_CONFIG_HOME/rofi/colors-noctalia.rasi";
            };
            wlogout = {
              input_path = "${config.xdg.configHome}/noctalia/templates/wlogout.css";
              output_path = "$XDG_CONFIG_HOME/wlogout/colors-noctalia.css";
            };
            fish = {
              input_path = "${config.xdg.configHome}/noctalia/templates/fish.theme";
              output_path = "$XDG_CONFIG_HOME/fish/conf.d/noctalia.fish";
            };
            starship = {
              input_path = "${config.xdg.configHome}/noctalia/templates/starship.toml";
              output_path = "$XDG_CONFIG_HOME/starship.toml";
            };
            qutebrowser = {
              input_path = "${config.xdg.configHome}/noctalia/templates/qutebrowser.py";
              output_path = "$XDG_CONFIG_HOME/qutebrowser/noctalia.py";
            };
            fcitx5 = {
              input_path = "${config.xdg.configHome}/noctalia/templates/fcitx5-theme.conf";
              output_path = "$XDG_DATA_HOME/fcitx5/themes/noctalia/theme.conf";
              post_hook = "fcitx5-remote -r || true";
            };
          };
        };
      };

      # Wallpaper — the dynamic wallpaper flow (`wallpaper` script) owns this path
      wallpaper.default.path = "${config.home.homeDirectory}/.config/abyss/.cache/current_wallpaper.png";
    };

    xdg.configFile."noctalia/templates" = {
      source = ../templates;
      recursive = true;
    };
  };
}
