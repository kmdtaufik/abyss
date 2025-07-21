{config, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      #change shell to bash
      font = {
        size = 12.0;
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
      };
      window = {
        opacity = 0.7;
        padding = {
          x = 15;
          y = 15;
        };
      };
      selection = {
        save_to_clipboard = true;
      };
      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
      };
    };
  };
}
