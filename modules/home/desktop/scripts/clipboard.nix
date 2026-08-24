{pkgs, ...}:
pkgs.writeShellApplication {
  name = "clipboard";
  runtimeInputs = with pkgs; [ cliphist rofi wl-clipboard ];
  text = ''
    #   ____ _ _       _     _     _
    #  / ___| (_)_ __ | |__ (_)___| |_
    # | |   | | | '_ \| '_ \| / __| __|
    # | |___| | | |_) | | | | \__ \ |_
    #  \____|_|_| .__/|_| |_|_|___/\__|
    #           |_|

    ROFI_CMD="rofi -dmenu -replace -p '󰅌 ' -theme-str 'listview {lines: 12;} configuration {show-icons: false;}'"

    case "''${1:-}" in
      d)
        cliphist list | eval "$ROFI_CMD" | cliphist delete
        ;;

      w)
        if [ "$(echo -e "Clear\nCancel" | rofi -dmenu -replace -p 'Wipe' -theme-str 'listview {lines: 2;} configuration {show-icons: false;}')" == "Clear" ]; then
          cliphist wipe
        fi
        ;;

      *)
        cliphist list | eval "$ROFI_CMD" | cliphist decode | wl-copy
        ;;
    esac
  '';
}
