{
  wayland.windowManager.hyprland.settings = {
    windowrule =[
    # Pavucontrol
    "match:class (.*org.pulseaudio.pavucontrol.*), float on"
    "match:class (.*org.pulseaudio.pavucontrol.*), size 700 600"
    "match:class (.*org.pulseaudio.pavucontrol.*), center on"
    "match:class (.*org.pulseaudio.pavucontrol.*), pin on"

    # ChatGPT
    "match:title (ChatGPT.*), float on"
    "match:title (.*chat.openai.com.*), float on"
    "match:title (.*chat.openai.com.*), size 500 50%"
    "match:title (.*chat.openai.com.*), move 20 70"

    # Waypaper
    "match:class (.*waypaper.*), float on"
    "match:class (.*waypaper.*), size 900 700"
    "match:class (.*waypaper.*), center on"
    "match:class (.*waypaper.*), pin on"

    # Blueman
    "match:class (blueman-manager), float on"
    "match:class (blueman-manager), size 800 600"
    "match:class (blueman-manager), center on"

    # nwg-look
    "match:class (nwg-look), float on"
    "match:class (nwg-look), size 700 600"
    "match:class (nwg-look), move 10% 20%"
    "match:class (nwg-look), pin on"

    # nwg-displays
    "match:class (nwg-displays), float on"
    "match:class (nwg-displays), size 1000 600"
    "match:class (nwg-displays), center on"
    "match:class (nwg-displays), pin on"

    # Mission Center
    "match:class (io.missioncenter.MissionCenter), float on"
    "match:class (io.missioncenter.MissionCenter), pin on"
    "match:class (io.missioncenter.MissionCenter), center on"
    "match:class (io.missioncenter.MissionCenter), size 900 600"
    
    # Combined props (Note: no comma between matches, comma before effect)
    "match:class (missioncenter) match:title:^(Preferences)$, float on"
    "match:class (missioncenter) match:title:^(Preferences)$, pin on"
    "match:class (missioncenter) match:title:^(Preferences)$, center on"

    # Calculator
    "match:class (org.gnome.Calculator), float on"
    "match:class (org.gnome.Calculator), size 700 600"
    "match:class (org.gnome.Calculator), center on"

    # Emoji Picker
    # "match:class (it.mijorus.smile), float on"
    # "match:class (it.mijorus.smile), pin on"
    "match:class (it.mijorus.smile), float on, pin on, move monitor_w-230 90, size 320 409"

    # Hyprland Share
    "match:class (hyprland-share-picker), float on"
    "match:class (hyprland-share-picker), pin on"
    "match:class (hyprland-share-picker), center on"
    "match:class (hyprland-share-picker), size 600 400"

    # General Floating
    "match:class (dotfiles-floating), float on"
    "match:class (dotfiles-floating), size 1000 700"
    "match:class (dotfiles-floating), center on"

    # Ghostty
    "match:class (ml4w.dotfiles.floating), float on"
    "match:class (ml4w.dotfiles.floating), size 1000 700"
    "match:class (ml4w.dotfiles.floating), center on"
    "match:class (ml4w.dotfiles.floating), pin on"
  ];

    layerrule = [
      # SwayNC
      "match:namespace swaync-control-center,blur on"
      "ignore_alpha 0.5, match:namespace swaync-control-center"
      "match:namespace swaync-notification-window,blur on"
      "ignore_alpha 0.5,match:namespace swaync-notification-window"
      "match:namespace waybar, blur on,ignore_alpha 0.5"
      # "match:namespace waybar, ignore_alpha 0.5"
    ];
  };
}
