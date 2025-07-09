{pkgs, ...}:
pkgs.writeShellApplication {
  name = "restore-wallpaper";

  text = ''
    #                _ _
    # __      ____ _| | |_ __   __ _ _ __   ___ _ __
    # \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__|
    #  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |
    #   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|
    #                   |_|         |_|
    #
    # -----------------------------------------------------
    # Restore last wallpaper
    # -----------------------------------------------------

    # -----------------------------------------------------
    # Set defaults
    # -----------------------------------------------------

    defaultwallpaper="$HOME/wallpaper/default.jpg"
    wallpaper="$HOME/.config/abyss/.cache/current_wallpaper.png"

    # -----------------------------------------------------
    # Get current wallpaper
    # -----------------------------------------------------

        if [ -f "$wallpaper" ]; then
            echo ":: Wallpaper $wallpaper exists"
        else
            echo ":: Wallpaper $wallpaper does not exist. Using default."
            wallpaper=$defaultwallpaper
        fi


    # -----------------------------------------------------
    # Set wallpaper
    # -----------------------------------------------------

    echo ":: Setting wallpaper with source image $wallpaper"
    hyprctl hyprpaper reload ,"$wallpaper"
  '';
}
