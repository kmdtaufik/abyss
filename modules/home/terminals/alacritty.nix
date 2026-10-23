{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        general = {
          import = [
            "~/.config/alacritty/themes/noctalia.toml"
          ];
        };
        window = {
          opacity = 0.7;
          padding = {
            x = 10;
            y = 10;
          };
        };
        selection = {
          save_to_clipboard = true;
        };
        cursor = {
          style = {
            shape = "Beam";
            blinking = "On";
          };
        };
      };
    };
  };
}
