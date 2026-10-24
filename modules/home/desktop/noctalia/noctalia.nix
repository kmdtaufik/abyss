{
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  config = lib.mkIf config.modules.noctalia.enable {
    # Note: stale state in ~/.local/state/noctalia/settings.toml merges on top of
    # ~/.config/noctalia/config.toml and can override theme settings; clear it manually if needed.
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
      checkConfig = true;
    };

    # Ensure placeholder theme files exist so applications can start cleanly
    # before the first Noctalia template generation pass runs.
    home.activation.noctaliaThemePlaceholders = lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p "$HOME/.config/niri" \
               "$HOME/.config/foot/themes" \
               "$HOME/.config/alacritty/themes" \
               "$HOME/.config/ghostty/themes" \
               "$HOME/.config/kitty/themes" \
               "$HOME/.config/btop/themes" \
               "$HOME/.config/rofi" \
               "$HOME/.config/wlogout" \
               "$HOME/.config/fish/conf.d" \
               "$HOME/.config/qutebrowser" \
               "$HOME/.config" \
               "$HOME/.local/share/fcitx5/themes/noctalia"

      [ -f "$HOME/.config/niri/noctalia.kdl" ] || touch "$HOME/.config/niri/noctalia.kdl"
      [ -f "$HOME/.config/foot/themes/noctalia" ] || touch "$HOME/.config/foot/themes/noctalia"
      [ -f "$HOME/.config/alacritty/themes/noctalia.toml" ] || touch "$HOME/.config/alacritty/themes/noctalia.toml"
      [ -f "$HOME/.config/ghostty/themes/noctalia" ] || touch "$HOME/.config/ghostty/themes/noctalia"
      [ -f "$HOME/.config/kitty/themes/noctalia.conf" ] || touch "$HOME/.config/kitty/themes/noctalia.conf"
      [ -f "$HOME/.config/btop/themes/noctalia.theme" ] || touch "$HOME/.config/btop/themes/noctalia.theme"
      [ -f "$HOME/.config/rofi/colors-noctalia.rasi" ] || touch "$HOME/.config/rofi/colors-noctalia.rasi"
      [ -f "$HOME/.config/wlogout/colors-noctalia.css" ] || touch "$HOME/.config/wlogout/colors-noctalia.css"
      [ -f "$HOME/.config/fish/conf.d/noctalia.fish" ] || touch "$HOME/.config/fish/conf.d/noctalia.fish"
      [ -f "$HOME/.config/qutebrowser/noctalia.py" ] || touch "$HOME/.config/qutebrowser/noctalia.py"
      [ -f "$HOME/.config/starship.toml" ] || touch "$HOME/.config/starship.toml"
      [ -f "$HOME/.local/share/fcitx5/themes/noctalia/theme.conf" ] || touch "$HOME/.local/share/fcitx5/themes/noctalia/theme.conf"
    '';
  };
}
