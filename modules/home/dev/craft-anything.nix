{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.craft-anything.homeModules.default
  ];

  config = lib.mkIf config.modules.craft-anything.enable {
    programs.craft-anything = {
      enable = true;
      package = inputs.craft-anything.packages.${pkgs.stdenv.hostPlatform.system}.default;
      extraEngines = with pkgs; [
        ghidra-bin
        frida-tools
        jadx
        apktool
        android-tools
        gdb
        rizin
      ];
    };
  };
}
