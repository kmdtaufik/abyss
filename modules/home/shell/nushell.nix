{
  programs.nushell = {
    enable = false;
    shellAliases = {
      rm = "rm -t";
      ll = "ls -la";
      la = "ls -a";
    };
    extraConfig = ''
      $env.config = {
        show_banner: false,
      }

      if ($env.TERM_PROGRAM? | default "") != "vscode" {
        cat ~/.cache/wal/sequences
      }
      if ($env.TTY | str contains "pts") {
       fastfetch --config examples/13
      }


    '';
  };
}
