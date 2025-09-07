{pkgs, ...}: {
  home = {
    shellAliases = {
      cd = "z";
      ".." = "cd ..";
      "..." = "cd ../..";
      "..3" = "cd ../../..";
      ff = "fastfetch";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";
      gpl = "git pull";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
