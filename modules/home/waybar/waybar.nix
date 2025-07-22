{
  programs.waybar.enable = true;
  home.file.".config/waybar/assets" = {
    source = ./assets;
    recursive = true;
  };
  imports = [
    ./waybar-settings.nix
    ./waybar-styles.nix
  ];
}
