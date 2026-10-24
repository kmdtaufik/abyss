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
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
      # Stylix needs the image inside the flake so it can be copied to the Nix
      # store at eval time. The `wallpaper` script keeps this file in sync with
      # the live wallpaper at ~/.config/abyss/.cache/current_wallpaper.png.
      # Noctalia reads the live wallpaper directly; Stylix reads this snapshot.
      image = ../../../current_wallpaper.png;
      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
      };
      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };
        sansSerif = {
          name = "Google Sans Flex";
        };
        serif = {
          package = pkgs.roboto-slab;
          name = "Roboto Slab";
        };
        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };
    };
  };
}
