{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.nvim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      sideloadInitLua = true;
      withPython3 = false;
      withNodeJs = false;
      withRuby = false;
      extraPackages = with pkgs; [
        gcc
        cargo
        rustc
        rust-analyzer
        nixd
        alejandra
        tree-sitter
        python3
        nodejs_24
        clang-tools
      ];
    };
  };
}
