{
  pkgs,
  config,
  lib,
  ...
}: {
  # OpenGL
  hardware.graphics = {
    enable = true;
  };
}
