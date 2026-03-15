{pkgs, ...}: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    # font = {
    #   name = "Cantarell";
    #   size = 11;
    #   package = pkgs.cantarell-fonts;
    # };
    gtk3.extraConfig = {
      gtk-toolbar-style = "GTK_TOOLBAR_ICONS";
      gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
      gtk-button-images = 0;
      gtk-menu-images = 0;
      gtk-enable-event-sounds = 1;
      gtk-enable-input-feedback-sounds = 0;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
  };
  stylix.targets.gtk = {
    enable = true;
  };
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark"; # ADD THIS
    };
  };
}
