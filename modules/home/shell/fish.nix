{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.fish.enable {
    programs.fish = {
      enable = true;

      shellAbbrs = {
        ga = "git add .";
        gc = "git commit -m ";
        gco = "git checkout ";
        gp = "git push ";
        gpl = "git pull ";
        gd = "git diff ";
        gb = "git branch ";
        #nix
        ns = "nix-shell -p";
      };
      functions = {
        fish_greeting = {
          body = ''
            #colorscheme
            # -----------------------------------------------------
            # Fastfetch
            # -----------------------------------------------------
            fastfetch --config examples/13
          '';
        };
      };
      shellInit = ''
        set -g fish_color_param 00ffff
      '';
    };
    programs.starship.enableFishIntegration = true;
    programs.zoxide.enableFishIntegration = true;
    stylix.targets.fish = {
      enable = true;
    };
  };
}
