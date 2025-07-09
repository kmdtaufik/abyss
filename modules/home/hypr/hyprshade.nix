{pkgs, ...}: {
  xdg.configFile."hypr/shaders" = {
    source = ./shaders;
    recursive = true;
  };
  home.packages = [
    pkgs.hyprshade
  ];
}
