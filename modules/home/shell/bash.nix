{pkgs, ...}: let
  inherit (import ../../../settings.nix) theShell;
in {
  programs.bash = {
    enable = true;
    initExtra = ''
      # Initialize bash completions
      #source ${pkgs.bash-completion}/share/bash_completion/bash_completion

      # Load pywal sequences if not inside VSCode terminal
      if [ "$TERM_PROGRAM" != "vscode" ]; then
        if [ -f "$HOME/.cache/wal/sequences" ]; then
          cat "$HOME/.cache/wal/sequences"
        fi
      fi
      # -----------------------------------------------------
      # Fastfetch
      # -----------------------------------------------------
      if [[ $(tty) == *"pts"* ]]; then
          fastfetch --config examples/13
      fi

      # ---- Chris Titus Utilities ----

    '';
  };

  home.packages = with pkgs; [
    bash-completion
    nix-bash-completions
  ];

  programs.starship.enableBashIntegration = true;
  programs.zoxide.enableBashIntegration = true;
}
