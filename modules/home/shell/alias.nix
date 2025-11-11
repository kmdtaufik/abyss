{pkgs, ...}: {
  home = {
    shellAliases = {
      cd = "z";
      ".." = "cd ..";
      "..." = "cd ../..";
      "..3" = "cd ../../..";
      ff = "fastfetch";
      walker = "walker --height 300";
      ls="eza --icons=always";
      la="ls -a";
      ll="ls -la";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
    packages = with pkgs;[
    eza
    ] ;
  };
}
