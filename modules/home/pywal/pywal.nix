{
  programs.pywal.enable = true;

  #Templates config
  xdg.configFile = {
    "wal/templates" = {
      source = ./templates;
      recursive = true;
    };
  };
}
