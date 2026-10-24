{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.noctalia.enable {
    programs.noctalia.settings = {
      # Use builtin Gruvbox theme; Stylix handles global theming
      theme = {
        source = "builtin";
        builtin = "Gruvbox";
        mode = "dark";
        templates = {
          enable_builtin_templates = false;
          enable_community_templates = false;
          builtin_ids = [];
          community_ids = [];
          user = {};
        };
      };

      # Wallpaper — the dynamic wallpaper flow (`wallpaper` script) owns this path
      wallpaper.default.path = "${config.home.homeDirectory}/.config/abyss/.cache/current_wallpaper.png";
    };
  };
}
