{
  config,
  lib,
  pkgs,
  ...
}: {
  home = {
    shellAliases = {
      cd = "z";
      ".." = "cd ..";
      "..." = "cd ../..";
      "..3" = "cd ../../..";
      ls = "eza --icons --group-directories-first -1";
      la = "ls -a";
      ll = "ls -la";
      cl = "clear";
      rm = "trash";
      mkdir = "mkdir -p";
      reboot = "systemctl reboot";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
    packages = with pkgs; [
      eza
      trashy
    ];
  };
}
