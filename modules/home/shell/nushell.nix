{
  programs.nushell = {
    enable = true;
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
       fastfetch --config examples/13
    '';
  };
  programs.starship.enableNushellIntegration = true;
}
