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
        nos = "nh os switch";
      };
      functions = {
        fish_greeting = {
          body = ''
            #colorscheme
            # -----------------------------------------------------
            # Fastfetch
            # -----------------------------------------------------
            if type -q fastfetch
              fastfetch --config examples/13
            end
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
    };
    programs.fish.interactiveShellInit = lib.mkAfter ''
      if command -v starship >/dev/null 2>&1
        starship init fish | source
      end
    '';
    programs.zoxide.enableFishIntegration = true;
  };
}
