{
  programs.pywal.enable = false;

  #Templates config
  xdg.configFile = {
    "wal/templates" = {
      enable=false;
      source = ./templates;
      recursive = true;
    };
  };
}
