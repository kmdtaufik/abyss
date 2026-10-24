{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.bash.enable {
    programs.bash = {
      enable = true;
      initExtra = ''
        if [[ $(tty) == *"pts"* ]]; then
            fastfetch --config examples/13
        fi

        nsh() {
          local pkgs=()
          local cmd=()
          local seen_sep=false
          for arg in "$@"; do
            if [[ "$arg" == "--" ]]; then
              seen_sep=true
              continue
            fi
            if [[ "$seen_sep" == true ]]; then
              cmd+=("$arg")
            else
              pkgs+=("nixpkgs#$arg")
            fi
          done
          if [[ ''${#cmd[@]} -eq 0 ]]; then
            nix shell "''${pkgs[@]}"
          else
            nix shell "''${pkgs[@]}" --command "''${cmd[@]}"
          fi
        }
      '';
    };
    programs = {
      starship.enableBashIntegration = true;
      zoxide.enableBashIntegration = true;
      carapace.enableBashIntegration = true;
    };
  };
}
