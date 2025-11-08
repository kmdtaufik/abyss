{
  imports = [
    ./trouble.nix
  ];
  vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      trouble = {
        enable = true;
      };
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
