{pkgs, ...}:
pkgs.writeShellApplication {
  name = "hypridle-menu";

  text = ''
    #  _   _                  _     _ _
    # | | | |_   _ _ __  _ __(_) __| | | ___
    # | |_| | | | | '_ \| '__| |/ _` | |/ _ \
    # |  _  | |_| | |_) | |  | | (_| | |  __/
    # |_| |_|\__, | .__/|_|  |_|\__,_|_|\___|
    #        |___/|_|
    #

    SERVICE="hypridle"
    if [[ "$1" == "status" ]]; then
        sleep 1
        if pgrep -x "$SERVICE" >/dev/null; then
            printf '{"text": "RUNNING", "class": "active", "tooltip": "Screen locking active\nLeft: Deactivate"}'
        else
            printf '{"text": "NOT RUNNING", "class": "notactive", "tooltip": "Screen locking deactivated\nLeft: Activate"}'
        fi
    fi
    if [[ "$1" == "toggle" ]]; then
        if pgrep -x "$SERVICE" >/dev/null; then
            killall hypridle
        else
            hypridle
        fi
    fi
  '';
}
