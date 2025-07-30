{pkgs, ...}:
pkgs.writeShellApplication {
  name = "wallpaper";

  runtimeInputs = [
    pkgs.imagemagick
    pkgs.matugen
    pkgs.libnotify
  ];

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
    notify "✅ Wallpaper" "Saved to $current_wallpaper" 30

    magick "$current_wallpaper" -resize 75% -blur "$blur_strength" "$blurred_wallpaper"
    notify "✅ Blurred Version" "Saved to $blurred_wallpaper" 60

    magick "$current_wallpaper" -gravity center -extent 1:1 "$square_wallpaper"
    notify "✅ Square Version" "Saved to $square_wallpaper" 80

    matugen image "$current_wallpaper" -m "dark"
    notify "🎨 Matugen" "Theme generated from wallpaper" 100

    sleep 0.1
    launch-bar

    sleep 0.1
    swaync-client -rs
  '';
}
