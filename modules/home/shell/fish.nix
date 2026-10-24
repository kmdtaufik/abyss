{
  config,
  lib,
  pkgs,
  ...
}: let
  c = config.lib.stylix.colors.withHashtag;
in {
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
      interactiveShellInit = ''
        # Base16 syntax highlighting (Stylix)
        set -g fish_color_normal '${c.base05}'
        set -g fish_color_command '${c.base0B}' --bold
        set -g fish_color_keyword '${c.base0E}' --bold
        set -g fish_color_quote '${c.base0A}'
        set -g fish_color_redirection '${c.base09}'
        set -g fish_color_end '${c.base0E}'
        set -g fish_color_error '${c.base08}'
        set -g fish_color_param '${c.base0D}'
        set -g fish_color_comment '${c.base03}'
        set -g fish_color_selection '${c.base05}' --bold '--background=${c.base02}'
        set -g fish_color_search_match '${c.base0A}' '--background=${c.base02}'
        set -g fish_color_operator '${c.base0C}'
        set -g fish_color_escape '${c.base0C}'
        set -g fish_color_autosuggestion '${c.base03}'
        set -g fish_color_cancel '${c.base08}' -r
        set -g fish_color_cwd '${c.base0B}'
        set -g fish_color_cwd_root '${c.base08}'
        set -g fish_color_user '${c.base0E}'
        set -g fish_color_host '${c.base0D}'
        set -g fish_color_host_remote '${c.base0A}'
        set -g fish_color_status '${c.base08}'
        set -g fish_color_valid_path --underline
        set -g fish_color_history_current --bold
        set -g fish_color_match --background='${c.base02}'

        set -g fish_pager_color_progress '${c.base04}' '--background=${c.base01}'
        set -g fish_pager_color_prefix '${c.base0D}' --bold --underline
        set -g fish_pager_color_completion '${c.base05}'
        set -g fish_pager_color_description '${c.base03}'
        set -g fish_pager_color_selected_background '--background=${c.base02}'
      '';
    };
    programs.starship.enableFishIntegration = true;
    programs.zoxide.enableFishIntegration = true;
    stylix.targets.fish.enable = false;
  };
}
