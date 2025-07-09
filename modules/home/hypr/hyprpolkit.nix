{pkgs, ...}: {
  services.hyprpolkitagent.enable = true;
  home.packages = [
    pkgs.hyprpolkitagent
  ];
}
