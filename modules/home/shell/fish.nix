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
        nsh = {
          body = ''
            set -l pkgs
            set -l cmd
            set -l seen_sep false
            for arg in ''$argv
              if test "$arg" = "--"
                set seen_sep true
                continue
              end
              if test "$seen_sep" = true
                set cmd ''$cmd ''$arg
              else
                set pkgs ''$pkgs "nixpkgs#''$arg"
              end
            end
            if test (count ''$cmd) -eq 0
              nix shell ''$pkgs
            else
              nix shell ''$pkgs --command ''$cmd
            end
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
