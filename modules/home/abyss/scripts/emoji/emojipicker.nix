{pkgs, ...}:
pkgs.writeShellApplication {
  name = "emojipicker";

  text = ''
    # Emoji Picker: Select emoji from ~/.emojis and copy to clipboard
    EMOJI_FILE="$HOME/.emojis"

    # Check if emoji file exists
    if [ ! -f "$EMOJI_FILE" ]; then
        echo "Emoji file not found: $EMOJI_FILE"
        exit 1
    fi

    # Determine clipboard tool
    if command -v wl-copy &>/dev/null; then
        CLIP="wl-copy"
    else
        echo "No clipboard tool (wl-copy or xclip) found."
        exit 1
    fi

    # Launch rofi to pick an emoji
    chosen=$(cut -f1,2 "$EMOJI_FILE" | rofi -dmenu -i -p "Emoji 🧃" -config ~/.config/rofi/config-compact.rasi)

    # Extract just the emoji (before tab)
    emoji=$(echo "$chosen" | cut -f1)

    # Copy to clipboard if not empty
    if [[ -n "$emoji" ]]; then
        echo -n "$emoji" | $CLIP
    fi
  '';
}
