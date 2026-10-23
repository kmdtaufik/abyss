{
  pkgs,
  config,
  lib ? pkgs.lib,
  ...
}:
let
  inherit (import ../../../../settings.nix) flakeDir;
  # Waybar's reload helper only exists when the waybar module is installed.
  barCmd = if config.modules.waybar.enable then "launch-bar" else "";
  # Noctalia renders its own notifications; swaync only when it is enabled.
  notifyCmd = if config.modules.swaync.enable then "swaync-client -rs" else "";
  matugenCmd =
    if config.modules.matugen.enable
    then ''
      matugen image "$current_wallpaper" -m "dark"
      notify "🎨 Matugen" "Theme generated from wallpaper" 100
    ''
    else "";
in
pkgs.writeShellApplication {
  name = "wallpaper";

  runtimeInputs = [
    pkgs.imagemagick
    pkgs.libnotify
  ] ++ lib.optional config.modules.matugen.enable pkgs.matugen;

  text = ''
    cache_dir="$HOME/.config/abyss/.cache"
    input="$1"

    if [[ -z "$input" || ! -f "$input" ]]; then
      notify-send --replace-id=99 "Wallpaper Error" "❌ Please provide a valid image file."
      exit 1
    fi

    function notify(){
    header="$1"
    body="$2"
    progress="$3"
    notify-send --replace-id=99 "$header" "$body" -h int:value:"$progress"
    }
    current_wallpaper="$cache_dir/current_wallpaper.png"
    blurred_wallpaper="$cache_dir/blurred_wallpaper.png"
    square_wallpaper="$cache_dir/square_wallpaper.png"
    blur_strength="50x30"

    notify "🖼️ Wallpaper Setup" "Processing image..." 10

    magick "$input" -quality 100 "$current_wallpaper"
    sleep 1

    # Keep the repo's current_wallpaper.png in sync so Stylix can read it at
    # eval time (flakes cannot reference absolute home-directory paths). Run
    # `git add current_wallpaper.png` before the next `nix flake check` if you
    # want Stylix to pick up the new palette immediately.
    cp -f "$current_wallpaper" "${flakeDir}/current_wallpaper.png"

    restore-wallpaper.sh
    notify "✅ Wallpaper" "Saved to $current_wallpaper" 30

    magick "$current_wallpaper" -resize 75% -blur "$blur_strength" "$blurred_wallpaper"
    notify "✅ Blurred Version" "Saved to $blurred_wallpaper" 60

    magick "$current_wallpaper" -gravity center -extent 1:1 "$square_wallpaper"
    notify "✅ Square Version" "Saved to $square_wallpaper" 80

    ${matugenCmd}

    sleep 0.1
    ${barCmd}

    sleep 0.1
    ${notifyCmd}
  '';
}
