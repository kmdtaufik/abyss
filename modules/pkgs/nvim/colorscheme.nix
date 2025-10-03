{pkgs, ...}: {
  config.vim = {
    theme = {
      enable = true;
      name = "tokyonight";
      style = "moon";
      transparent = true;
    };
  };
}
