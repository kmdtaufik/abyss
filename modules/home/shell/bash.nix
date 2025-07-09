{pkgs, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "lsd";
      ll = "ls -la";
      la = "ls -a";
    };

    initExtra = ''
      # Initialize blesh
      source ${pkgs.blesh}/share/blesh/ble.sh

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
    blesh
    coreutils
    findutils
    gawk
    util-linux
    rsync # Needed for progress-bar cp/mv
    unzip # For zip files
    unrar # For rar files
    p7zip # For .7z files
    lsd
  ];

  programs.starship.enableBashIntegration = true;
  programs.zoxide.enableBashIntegration = true;
  programs.oh-my-posh.enableBashIntegration = false;
}
