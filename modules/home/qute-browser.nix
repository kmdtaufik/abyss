{pkgs, ...}: {
  programs.qutebrowser = {
    enable = true;
    package = pkgs.qutebrowser-qt5;
  };
}
