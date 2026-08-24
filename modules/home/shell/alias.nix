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
      rofi = "rofi -show drun";
      wlogout = "wlogout -b 2 -c 0 -r 0 -L 930 -R 930 -T 300 -B 300 --protocol layer-shell";
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

