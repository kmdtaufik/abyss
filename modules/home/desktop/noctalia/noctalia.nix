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
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
      checkConfig = true;
    };

    # Noctalia's state file merges on top of the Nix-managed config. After
    # switching from Noctalia-generated templates to Stylix, trim the stale
    # [theme] and [bar.default] sections so the Nix config (Stylix palette,
    # single bar.main) takes effect. Also remove leftover Noctalia template
    # outputs that are no longer regenerated.
    home.activation.noctaliaCleanup = lib.hm.dag.entryAfter ["writeBoundary"] ''
      state_file="$HOME/.local/state/noctalia/settings.toml"
      if [ -f "$state_file" ]; then
        tmp=$(mktemp)
        awk '/^\[bar\.default\]/ { skip=1; next }
             /^\[[^ ]+\]/ { skip=0 }
             skip==0 { print }' "$state_file" > "$tmp"
        awk '/^\[theme\]/ { skip=1; next }
             /^\[[^ ]+\]/ { skip=0 }
             skip==0 { print }' "$tmp" > "$state_file"
        rm -f "$tmp"
      fi

      rm -f "$HOME/.config/niri/noctalia.kdl" \
            "$HOME/.config/foot/themes/noctalia" \
            "$HOME/.config/alacritty/themes/noctalia.toml" \
            "$HOME/.config/ghostty/themes/noctalia" \
            "$HOME/.config/kitty/themes/noctalia.conf" \
            "$HOME/.config/btop/themes/noctalia.theme" \
            "$HOME/.config/rofi/colors-noctalia.rasi" \
            "$HOME/.config/wlogout/colors-noctalia.css" \
            "$HOME/.config/fish/conf.d/noctalia.fish" \
            "$HOME/.config/qutebrowser/noctalia.py" \
            "$HOME/.config/starship/noctalia.toml" \
            "$HOME/.local/share/fcitx5/themes/noctalia/theme.conf"

      rmdir "$HOME/.config/foot/themes" "$HOME/.config/alacritty/themes" \
            "$HOME/.config/ghostty/themes" "$HOME/.config/kitty/themes" \
            "$HOME/.config/btop/themes" "$HOME/.config/starship" \
            "$HOME/.local/share/fcitx5/themes/noctalia" \
            "$HOME/.local/share/fcitx5/themes" 2>/dev/null || true
    '';
  };
}
