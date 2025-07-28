{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Pavucontrol
      "float,class:(.*org.pulseaudio.pavucontrol.*)"
      "size 700 600,class:(.*org.pulseaudio.pavucontrol.*)"
      "center,class:(.*org.pulseaudio.pavucontrol.*)"
      "pin,class:(.*org.pulseaudio.pavucontrol.*)"

      # ChatGPT
      "float,title:(ChatGPT.*)"
      "float,title:(.*chat.openai.com.*)"
      "size 500 50%,title:(.*chat.openai.com.*)"
      "move 20 70,title:(.*chat.openai.com.*)"

      # Waypaper
      "float,class:(.*waypaper.*)"
      "size 900 700,class:(.*waypaper.*)"
      "center,class:(.*waypaper.*)"
      "pin,class:(.*waypaper.*)"

      # ML4W Apps
      "float,class:(com.ml4w.calendar)"
      "move 100%-w-16 66,class:(com.ml4w.calendar)"
      "pin,class:(com.ml4w.calendar)"
      "size 400 400,class:(com.ml4w.calendar)"

      "float,class:(com.ml4w.sidebar)"
      "move 100%-w-16 66,class:(com.ml4w.sidebar)"
      "pin,class:(com.ml4w.sidebar)"
      "size 400 740,class:(com.ml4w.sidebar)"

      "float,class:(com.ml4w.welcome)"
      "size 700 600,class:(com.ml4w.welcome)"
      "center,class:(com.ml4w.welcome)"
      "pin,class:(com.ml4w.welcome)"

      "float,class:(com.ml4w.settings)"
      "size 800 600,class:(com.ml4w.settings)"
      "move 10% 20%,class:(com.ml4w.settings)"

      # Blueman
      "float,class:(blueman-manager)"
      "size 800 600,class:(blueman-manager)"
      "center,class:(blueman-manager)"

      # nwg-look
      "float,class:(nwg-look)"
      "size 700 600,class:(nwg-look)"
      "move 10% 20%,class:(nwg-look)"
      "pin,class:(nwg-look)"

      # nwg-displays
      "float,class:(nwg-displays)"
      "size 900 600,class:(nwg-displays)"
      "move 10% 20%,class:(nwg-displays)"
      "pin,class:(nwg-displays)"

      # Mission Center
      "float,class:(io.missioncenter.MissionCenter)"
      "pin,class:(io.missioncenter.MissionCenter)"
      "center,class:(io.missioncenter.MissionCenter)"
      "size 900 600,class:(io.missioncenter.MissionCenter)"
      "float,class:(missioncenter),title:^(Preferences)$"
      "pin,class:(missioncenter),title:^(Preferences)$"
      "center,class:(missioncenter),title:^(Preferences)$"

      # Calculator
      "float,class:(org.gnome.Calculator)"
      "size 700 600,class:(org.gnome.Calculator)"
      "center,class:(org.gnome.Calculator)"

      # Emoji Picker
      "float,class:(it.mijorus.smile)"
      "pin,class:(it.mijorus.smile)"
      "move 100%-w-40 90,class:(it.mijorus.smile)"

      # Hyprland Share
      "float,class:(hyprland-share-picker)"
      "pin,class:(hyprland-share-picker)"
      "center,title:class:(hyprland-share-picker)"
      "size 600 400,class:(hyprland-share-picker)"

      # General Floating
      "float,class:(dotfiles-floating)"
      "size 1000 700,class:(dotfiles-floating)"
      "center,class:(dotfiles-floating)"

      # Ghostty
      "float,class:(ml4w.dotfiles.floating)"
      "size 1000 700,class:(ml4w.dotfiles.floating)"
      "center,class:(ml4w.dotfiles.floating)"
      "pin,class:(ml4w.dotfiles.floating)"
    ];

    layerrule = [
      # SwayNC
      "blur, swaync-control-center"
      "blur, swaync-notification-window"
      "ignorezero, swaync-control-center"
      "ignorezero, swaync-notification-window"
      "ignorealpha 0.5, swaync-control-center"
      "ignorealpha 0.5, swaync-notification-window"
    ];
  };
}
