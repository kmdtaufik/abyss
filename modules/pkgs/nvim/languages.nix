{
  vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints = {
        enable = true;
      };
    };
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableDAP = true;
      nix.enable = true;
    };
  };
}
