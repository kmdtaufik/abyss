{ pkgs, ... }:
{
  # Install swappy via home.packages
  home.packages = with pkgs; [ swappy ];

  # Place the swappy configuration file at ~/.config/swappy/config
  home.file.".config/swappy/config".text = ''
    [Default]
    save_dir = $HOME/Pictures/screenshots
    save_filename_format = screenshot-%Y%m%d-%H%M%S.png
    show_panel = false
    line_size = 5
    text_size = 20
    text_font = sans-serif
    paint_mode = brush
    early_exit = false
    fill_shape = false
  '';
}
