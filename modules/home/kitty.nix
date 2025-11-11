{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    shellIntegration.mode=null;
    settings = {
      bold_font                  = "auto";
      italic_font                = "auto";
      bold_italic_font           = "auto";
      remember_window_size       = false; # 'no' becomes 'false'
      initial_window_width       = 950;
      initial_window_height      = 500;
      cursor_blink_interval      = 0.5;
      cursor_stop_blinking_after = 1;
      scrollback_lines           = 2000;
      wheel_scroll_min_lines     = 1;
      enable_audio_bell          = false; # 'no' becomes 'false'
      window_padding_width       = 10;
      hide_window_decorations    = true;  # 'yes' becomes 'true'
      background_opacity         = 0.7;
      dynamic_background_opacity = true;  # 'yes' becomes 'true'
      confirm_os_window_close    = 0;
      selection_foreground       = "none";
      selection_background       = "none";
       
      cursor_trail               = 1; 
    };

    extraConfig = "include colors-matugen.conf";
  };
}
