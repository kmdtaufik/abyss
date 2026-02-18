{
  programs.direnv = {
    enable = true;
    silent = false;
    # loadInNixShell = false;
    nix-direnv.enable = true;
    # enableFishIntegration = true;
    # enableBashIntegration = true;
  };
}
