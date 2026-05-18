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
      walker = "walker --height 300";
      ls = "eza --icons --group-directories-first -1";
      la = "ls -a";
      ll = "ls -la";
      cl = "clear";
      rm = "trash";
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
