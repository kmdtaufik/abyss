{
  services.xsettingsd = {
    enable = true;
    settings = # conf
      {
        "Net/ThemeName" = "Adwaita";
        "Net/IconThemeName" = "Papirus-Dark";
        "Gtk/CursorThemeName" = "Bibata-Modern-Ice";
        "Net/EnableEventSounds" = true;
        "EnableInputFeedbackSounds" = false;
        "Xft/Antialias" = true;
        "Xft/Hinting" = true;
        "Xft/HintStyle" = "hintslight";
        "Xft/RGBA" = "rgb";
      };
  };
}
