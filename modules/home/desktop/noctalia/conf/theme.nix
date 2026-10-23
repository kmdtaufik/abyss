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
          };
        };
      };

      # Wallpaper — the dynamic wallpaper flow (`wallpaper` script) owns this path
      wallpaper.default.path = "${config.home.homeDirectory}/.config/abyss/.cache/current_wallpaper.png";
    };
  };
}
