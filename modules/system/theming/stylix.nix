{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.systemModules.stylix.enable {
    stylix = {
      enable = true;
      autoEnable = false;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
      };
      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "Jetbrains Mono";
        };
        sansSerif = {
          name = "Google Sans Flex";
        };
      };
    };
  };
}
